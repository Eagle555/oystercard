require 'oyster'

describe Oyster do
  it "Balance to default zero" do
    card = Oyster.new
    expect(card.balance).to eq(0)
   end 
end