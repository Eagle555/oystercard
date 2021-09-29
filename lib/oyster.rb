require_relative 'journey'

class Oyster
  attr_reader :balance
  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
  end
  
  def top_up(money)
    return "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if balance + money > 90
    @balance += money
  end
  
  def deduct(money)
    @balance -= money
  end
  
end