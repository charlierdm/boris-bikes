require 'van'

describe Van do

  let(:bike) { double :bike, broken?: false, working?: true }

  it 'has a variable capacity' do
    van = Van.new(10)
    expect(van.capacity).to eq(10)
  end

  it 'can accept bikes from the station' do
    dock = DockingStation.new
    dock.dock(bike)
    expect { subject.take_bike(dock.release_bike) }.to change { subject.bikes_transit.length }.by(1)
  end

  it 'can drop the bike off' do
    dock = DockingStation.new
    dock.dock(bike)
    subject.take_bike(dock.release_bike)
    expect { subject.give_bike }.to change { subject.bikes_transit.length }.by(-1)
  end

end
