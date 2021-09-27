class Oyster
  attr_reader :balance
  
  def initialize
    @balance = 0
  end
  
  def top_up(money)
    return "Limit 90 pounds" if @balance + money > 90
    @balance =+ money
  end

end