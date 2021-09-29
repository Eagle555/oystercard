require_relative 'oyster'

class Journey
    
  attr_accessor :minimum_balance
  attr_reader :oystercard
  MINIUM_BALANCE = 1
  
    def initialize
      @oystercard = Oyster.new
      @journey = false
      @minimum_balance = MINIUM_BALANCE
    end

    def touch_in
      return "Minimum amount of £#{minimum_balance} required!" if @oystercard.balance < minimum_balance
      @journey = true
    end

    def touch_out
      @journey = false
    end

    def in_journey?
     @journey
    end

end