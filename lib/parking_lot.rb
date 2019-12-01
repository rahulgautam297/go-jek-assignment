class ParkingLot
  PARKING_FULL_MESSAGE = 'Sorry, parking lot is full'
  attr_accessor :slots, :size

  def initialise(size)
    @size = size
    current_size = 0
    @slots = []
    size.to_i.times do |index|
      slot_number = index + 1
      @slots[index] = Slot.new(slot_number)
    end
    puts "Created a parking lot with #{ size } slots"
  end
end