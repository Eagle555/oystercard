class Journey
    
  attr_accessor :minimum_balance
  MINIUM_BALANCE = 1
  
    def initialize
      @journey = false
      @minimum_balance = MINIUM_BALANCE
    end

    def touch_in(oyster)
      return "Minimum amount of £#{minimum_balance} required!" if oyster < minimum_balance
      @journey = true
    end

    def touch_out
      @journey = false
    end

    def in_journey?
     @journey
    end

end