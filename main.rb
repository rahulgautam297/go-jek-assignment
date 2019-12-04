require_relative './lib/parking_lot'

def process_input(input)
  latest_parking_lot = nil
  input.split("\n").each do |input|
    sliced_input = input.split(/\s/)
    command = sliced_input[0]
    if  command == 'create_parking_lot'
      no_of_slots = sliced_input[1]
      latest_parking_lot = ParkingLot.new(no_of_slots)
    else
      latest_parking_lot.send(command, *([sliced_input[1], sliced_input[2]].compact))
    end
  end
end

$latest_parking_lot_interactive = nil

def process_input_for_interactive(input)
  sliced_input = input.split(/\s/)
  command = sliced_input[0]
  if  command == 'exit'
    exit
  elsif  command == 'create_parking_lot'
    no_of_slots = sliced_input[1]
    $latest_parking_lot_interactive = ParkingLot.new(no_of_slots)
  else
    $latest_parking_lot_interactive.send(command, *([sliced_input[1], sliced_input[2]].compact))
  end
end

def startIneractiveConsole()
  loop do
    process_input_for_interactive(gets.chomp)
  end
end

def main
  if (ARGV.length == 0)
    startIneractiveConsole()
  else
    begin
      input = File.read(ARGV[0])
      rescue StandardError => bang
        puts "Error reading file #{ bang }"
        return
      end
    end
    begin
      process_input(input)
    rescue StandardError => bang
      puts "Error processing input. Error - #{ bang }"
  end
end

main()

