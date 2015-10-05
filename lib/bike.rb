class Bike

  def initialize
    @broken = false
  end

  def broken?
    broken
  end

  def working?
    !broken
  end

  def report_broken
    self.broken = true
  end

  private

  attr_accessor :broken

end
