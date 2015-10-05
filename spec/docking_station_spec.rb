require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:dock).with(1).argument }

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'can have a specified capacity' do
    subject = described_class.new(5)
    expect(subject.capacity).to eq 5
  end

  describe '#release_bike' do
    it 'raises an error if no bikes available' do
      expect{ subject.release_bike }.to raise_error(RuntimeError, 'No bikes available')
    end
    it 'releases a working bike if it has one' do
      bike = double :bike, working?: true
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
    it 'will not release a broken bike' do
      bike = double :bike, working?: false
      subject.dock(bike)
      expect{ subject.release_bike }.to raise_error(RuntimeError, 'No bikes available')
    end
  end

  describe '#dock' do
    it 'raises an error if capacity has been reached' do
      bike = double :bike
      subject.capacity.times { subject.dock(bike) }
      expect{ subject.dock(bike) }.to raise_error(RuntimeError, 'Docking station full')
    end
  end

end
