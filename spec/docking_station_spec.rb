require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:dock).with(1).argument }


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
      subject.dock(Bike.new) until subject.full?
      expect{ subject.dock(Bike.new) }.to raise_error(RuntimeError, 'No slots available')
    end
  end

end
