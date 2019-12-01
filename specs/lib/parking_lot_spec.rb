require_relative '../../lib/parking_lot'

describe ParkingLot do
  describe 'initialize a parking lot' do
    context 'given input paramaters are correct' do
        it 'returns new parking lot instance' do
          parking_lot = ParkingLot.new('1')
          expect(parking_lot.slots.length).to eql(1)
          expect(parking_lot.slots[0].id).to eql(1)
          parking_lot2 = ParkingLot.new(2)
          expect(parking_lot2.slots.length).to eql(2)
      end
    end

    context 'given input paramaters have partial or no parameters' do
      it 'throws exception due to missing argument errors' do
        expect { ParkingLot.new }.to raise_error(ArgumentError)
      end
    end
  end


end