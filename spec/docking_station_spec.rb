require 'docking_station'

describe DockingStation do
  describe '#initialize' do
    it 'creates a new DockingStation' do
      expect { DockingStation.new }.to_not raise_error
    end
  end


  it 'responds to release_bike' do
    expect(subject).to respond_to :release_bike
  end

  it 'returns a bike' do
   expect(subject.release_bike.class).to eq Bike
  end

   it 'returns a working bike' do
     expect(subject.release_bike.working?).to be true
   end
end
