require 'oyster'

describe Oyster do
  card = Oyster.new
  it "Balance to default zero" do
    expect(card.balance).to eq(0)
   end 
   it 'it should respond to #top_up' do
    expect(card).to respond_to(:top_up) 
   end
   it 'can #top_up the balance' do
    expect{ card.top_up 1 }.to change{card.balance}.by 1
   end
   it 'oyster card respond to limit of £90' do
    maximun_balance = Oyster::MAXIMUM_BALANCE 
    expect(card.top_up(maximun_balance + 1)).to eq("Maximum balance of #{maximun_balance} exceeded")
   end
end

