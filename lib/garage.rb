class Garage
  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @storage = []
    @capacity = capacity
  end

  def fix_bike(bike)
    @broken = false
  end

  private

  def full
    storage.count >= DEFAULT_CAPACITY
  end

end
