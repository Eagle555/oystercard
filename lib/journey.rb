class Journey
  MINIMUM_FARE = 1

  def initialize(entry_station=nil)
    @entry_station = entry_station
    @exit_station = nil
  end

  def finish(station)
    @exit_station = station
    self
  end 

  def fare
    @fare = MINIMUM_FARE
  end 

  def complete?
    !@exit_station.nil? 
  end 
end 
