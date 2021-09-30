require 'oystercard'

describe Oystercard do
  card = Oystercard.new

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
    maximum_balance = Oystercard::MAXIMUM_BALANCE 
    expect(card.top_up(maximum_balance + 1)).to eq("Maximum balance of #{maximum_balance} exceeded")
   end
   it 'it should respond to balance' do
     expect(card).to respond_to(:deduct)
   end
   it 'can #deduct the balance' do
     card.top_up(20)
     expect{ card.deduct 10 }.to change{ card.balance }.by -10
   end

   it 'should respond to #touch_in' do
   expect(subject).to respond_to(:touch_in)
 end
 it 'should respond to #touch_out' do
   expect(subject).to respond_to(:touch_out)
 end
 it 'is initiially not in journey' do
   expect(subject).not_to be_in_journey
 end
 it 'requires a minimum balance of £1 on touch in' do
   expect(subject.touch_in).to eq("Minimum amount of £#{subject.minimum_balance} required!")
 end
 it 'can #touch_in' do
   subject.top_up(2)
   subject.touch_in
   expect(subject).to be_in_journey
 end
 it 'can #touch_out' do
   subject.touch_in
   subject.touch_out
   expect(subject).not_to be_in_journey
 end

 it 'will deduct the fare when you touch out' do
   subject.touch_in
   subject.touch_out
   expect{subject.touch_out}.to change{subject.balance}.by(-1)
 end
end

