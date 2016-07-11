require_relative 'weather'
require_relative 'plane'

class Airport

MAX_CAPACITY = 20

attr_reader :capacity, :hangar, :forecast

def initialize(capacity = MAX_CAPACITY)
@capacity = capacity
@hangar = []
@forecast = Weather.new
end

def land(plane)
raise "Airport is full" if full?
raise "The weather does not allow to land" if stormy?
plane.flying = false
hangar << plane

end

def take_off
fail "Airport is empty" if empty?
fail "The weather does not allow to take off" if stormy?
hangar.first.flying = true
hangar.pop

end


def landed_planes

hangar.count

end

private
def full?

hangar.count >= capacity

end

private
def empty?

hangar.empty?

end

def stormy?
  forecast.stormy?
end



end
