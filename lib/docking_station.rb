class DockingStation

  CAPACITY = 5

  def initialize
    @bikes = []
  end

  def release_bike
    fail 'No bikes available' if bikes.empty?
    bikes.pop
  end

  def dock(bike)
    fail 'No slots available' if full?
    bikes << bike
  end

  def full?
    bikes.length >= CAPACITY
  end

  private

  attr_reader :bikes

end
