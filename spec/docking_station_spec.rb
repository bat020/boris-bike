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
      subject.dock(Bike.new)
      expect(subject.release_bike).to be_working
    end
  end

  describe '#dock' do
    it 'raises an error if capacity has been reached' do
      subject.capacity.times { subject.dock(Bike.new) }
      expect{ subject.dock(Bike.new) }.to raise_error(RuntimeError, 'Docking station full')
    end
  end

end
