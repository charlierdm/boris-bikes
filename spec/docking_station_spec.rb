require 'docking_station'

describe DockingStation do

  let(:bike) { double :bike}
  let(:capacity) { DockingStation::DEFAULT_CAPACITY}

  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:dock).with(1).argument }

  it 'docks something' do
    expect(subject.dock(bike)).to eq [bike]
  end
  #
  it 'returns docked bikes' do
    subject.dock(bike)
    expect(subject.bikes.last).to eq bike
  end

  describe '#initialize' do
    it 'has a capacity of 20' do
      expect(subject.capacity).to eq(20)
    end

    it 'can vary initial capacity' do
      dock = DockingStation.new(50)
      expect(dock.capacity).to eq(50)
    end
  end

  describe '#release_bike' do
    it 'releases a bike' do
      bike = double(:bike, broken?: false, working?: true)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe '#dock' do

    it 'raises an error when full' do
      capacity.times { subject.dock(bike) }
      expect { subject.dock bike }.to raise_error 'Docking station full'
    end
  end

  it 'releases working bikes' do
    bike = double(:bike, broken?: false, working?: true)
    subject.dock(bike)
    subject.release_bike
    expect(bike).not_to be_broken
  end

  it 'wont release broken bikes' do
    bike = double(:bike, broken?: true, working?: true)
    subject.dock(bike)
    expect { subject.release_bike }.to raise_error 'Bike is broken'
  end

end
