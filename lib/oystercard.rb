require 'journey'

class Oystercard
  attr_reader :balance, :entry_station, :journeys, :exit_station
  attr_accessor :minimum_balance
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1
  
  def initialize
    @balance = 0
    @journeys = []
    #keep journeys, need it for oystercard to see what it's doing. 
    @minimum_balance = MINIMUM_BALANCE
  end
  
  def top_up(money)
    return "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if @balance + money > 90
    @balance += money
  end

  def touch_in(station)
      return "Minimum amount of £#{minimum_balance} required!" if @balance < minimum_balance
      @journeys << Journey.new(station) 
      #let is only used for rspec tests.
      # @entry_station = station  - stored in Journey.new(station) =< initialised with optional entry station 
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @journeys.last.finish(station) # .last is the method to get the last element of an array
    # use finish on the last element. 
    # @exit_station = station - no longer needed
    # journey = {:entry_station => @entry_station, :exit_station => @exit_station}
    #string has lots of methods, use symbols instead so it's just one object instead of many instances,
    #saves in memory. 
    # @journeys << {entry_station: @entry_station, exit_station: @exit_station}
    # @entry_station = nil  - no longer needed as journey instance is created
  end

    def in_journey?
    #  !!@entry_station - no entry station variable anymore. 
    return false if @journeys.empty?
    !@journeys.last.complete?
    end
    
    private 
    def deduct(money)
      @balance -= money
    end
end