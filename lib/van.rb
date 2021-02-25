class Van

  attr_reader :bikes_transit, :capacity

  def initialize(capacity = 5)
    @bikes_transit = []
    @capacity = capacity
  end

  def take_bike(bike)
    @bikes_transit << bike
  end

  def give_bike
    @bikes_transit.pop
  end

  def full?
    @bikes_transit.count >= @capacity
  end

end
