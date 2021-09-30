class Oystercard
  attr_reader :balance, :entry_station, :journeys, :exit_station
  attr_accessor :minimum_balance
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1
  
  def initialize
    @balance = 0
    @journeys = []
    @minimum_balance = MINIMUM_BALANCE
  end
  
  def top_up(money)
    return "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if @balance + money > 90
    @balance += money
  end

  def touch_in(station)
      return "Minimum amount of £#{minimum_balance} required!" if @balance < minimum_balance
      @entry_station = station
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @exit_station = station
    # journey = Hash.new 
    # journey []
    # journey = {entry_station => @entry_station, exit_station => @exit_station}
    @journeys << {entry_station: @entry_station, exit_station: @exit_station}
    @entry_station = nil 
  end

    def in_journey?
     !!@entry_station
    end
    
    private 
    def deduct(money)
      @balance -= money
    end
end