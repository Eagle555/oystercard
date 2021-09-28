class Journey

    def initialize
      @journey = false
    end

    def touch_in
      @journey = true
    end

    def touch_out
      @journey = false
    end

    def in_journey?
     @journey
    end

end