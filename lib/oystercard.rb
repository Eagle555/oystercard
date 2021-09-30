class Oystercard
  attr_reader :balance
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

  def touch_in
      return "Minimum amount of £#{minimum_balance} required!" if @balance < minimum_balance
      @journey = true
    end

    def touch_out
      deduct(MINIMUM_FARE)
      @journey = false
    end

    def in_journey?
     @journey
    end

    private 
    def deduct(money)
      @balance -= money
    end
end