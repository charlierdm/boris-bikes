class Van

  def initialize(capacity = 5)
    @broken_bikes = []
    @capacity = capacity
  end

  def take_bike(bike)
    @broken_bikes << bike
  end

  def give_bike
    @broken_bikes.pop
  end

  def full?
    @broken_bikes.count >= @capacity
  end


end
