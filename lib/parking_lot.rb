require_relative './slot'

class ParkingLot

  PARKING_FULL_MESSAGE = 'Sorry, parking lot is full'

  attr_accessor :slots

  def initialize(size)
    @slots = []
    size.to_i.times do |index|
      slot_number = index + 1
      slots[index] = Slot.new(slot_number)
    end
    puts "Created a parking lot with #{ size } slots\n"
  end

  def park(vehicle_name, vehicle_number)
    if next_free_slot
      puts "Allocated slot number: #{ next_free_slot.id }\n"
      next_free_slot.park(vehicle_name, vehicle_number)
    else
      parking_lot_full_handler
    end
  end

  def leave(slot_number)
    slot_number = slot_number.to_i
    if slot_number > 0 && slot_number <= slots.length
      slots[slot_number - 1].free
      puts "Slot number #{ slot_number.to_i } is free\n"
    else
      puts "Invalid slot number\n"
    end
  end

  def status
    puts "Slot No.    Registration No    Colour\n"
    slots.each do | slot |
      puts "#{ slot.id }           #{ slot.vehicle_number }      #{ slot.vehicle_color }\n" unless (slot.free?)
    end
  end

  def registration_numbers_for_cars_with_colour (color)
    filtered_cars = filter_cars('vehicle_number', 'vehicle_color', color)
    puts filtered_cars.compact.join(', ')
  end

  def slot_numbers_for_cars_with_colour (color)
    filtered_cars = filter_cars('id', 'vehicle_color', color)
    puts filtered_cars.compact.join(', ')
  end

  def slot_number_for_registration_number (vehicle_number)
    slot = slots.find do |slot|
      slot.vehicle_number == vehicle_number
    end
    puts slot ? slot.id : "Not found\n"
  end

  private
    def next_free_slot
      slots.find do |slot|
        slot.free?
      end
    end

    def parking_lot_full_handler
      puts ParkingLot::PARKING_FULL_MESSAGE
    end

    def filter_cars(filtered_value, filter_by, filter)
      slots.collect do |slot|
        slot.send(filtered_value) if slot.send(filter_by) == filter
      end
    end
end