require 'oyster'

describe Oyster do
  it "Balance to default zero" do
    card = Oyster.new
    expect(card.balance).to eq(0)
   end 
   it 'it should respond to #top_up' do
    card = Oyster.new
    expect(card).to respond_to(:top_up) 
   end
   it 'can #top_up the balance' do
    card = Oyster.new
    expect{ card.top_up 1 }.to change{card.balance}.by 1
   end
end

