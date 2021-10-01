require 'oystercard'

describe Oystercard do
  card = Oystercard.new

  #double is an Rspec creation, you will make a station object in future, 
  let(:entry_station){double :fake_entry_station}
  #  entry_station = "Hampstead" - overwritten the content of entry station, will contain the 
  #  string and not the mock class.  
  let(:exit_station){double :fake_exit_station}
  #let is a global variable, can be seen everywhere 

  it 'has a balance which starts at a default zero' do
    expect(card.balance).to eq(0)
  end

  it 'should respond to #top_up' do
    expect(card).to respond_to(:top_up) 
  end

  it 'has a maximum balance limit of £90' do
    maximum_balance = Oystercard::MAXIMUM_BALANCE 
    expect(card.top_up(maximum_balance + 1)).to eq("Maximum balance of #{maximum_balance} exceeded")
  end
  #  it 'it should respond to balance' do
  #    expect(card).to respond_to(:deduct)
  #  end
  #  it 'can #deduct the balance' do
  #    card.top_up(20)
  #    expect{ card.deduct 10 }.to change{ card.balance }.by -10
  #  end

  it 'should respond to #touch_in' do
    expect(subject).to respond_to(:touch_in)
  end

  it 'should respond to #touch_out' do
    expect(subject).to respond_to(:touch_out)
  end

  it 'is initially not in journey' do
    expect(subject).not_to be_in_journey
  end

  it 'requires a minimum balance of £1 on touch in' do
    expect(subject.touch_in("Angel")).to eq("Minimum amount of £#{subject.minimum_balance} required!")
  end

  it 'has an empty list of journeys by default' do
    expect(subject.journeys.length).to eq(0)
  end 

  describe '#top_up' do
    it 'should add the amount to the balance of the card' do 
    expect{ card.top_up 1 }.to change{ card.balance}.by 1
    end
  end 

  describe '#touch_in' do
    it 'expects the card to be in journey after touching in' do
      subject.top_up(2)
      subject.touch_in(entry_station)
      expect(subject).to be_in_journey
    end  

    # it 'stores the entry station' do
    #   subject.top_up(2)
    #   subject.touch_in(entry_station)
    #   expect(subject.entry_station).to eq(entry_station)
    # end
  end

  describe '#touch_out' do 
  #  let(:exit_station) {"Angel"}
  #  let(:entry_station) {"Liverpool_Street"}
  #This is a variable. not needed as we have doubles and variables from that in top level. 

    let(:journey){ {entry_station: entry_station, exit_station: exit_station}}
    
    # it 'stores a journey' do
    #   subject.top_up(2)
    #   subject.touch_in(entry_station)
    #   subject.touch_out(exit_station)
    #   expect(subject.journeys).to include journey
    # end 

    it 'can touch_out of the station and not be in journey' do
      subject.top_up(2)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject).not_to be_in_journey
    end

    it 'will deduct the fare when you touch out' do
      subject.top_up(5)
      subject.touch_in(entry_station)
      expect{subject.touch_out(exit_station)}.to change{subject.balance}.by(-Oystercard::MINIMUM_FARE)
    end

    # it 'stores exit station' do
    #   subject.touch_in(entry_station)
    #   subject.touch_out(exit_station)
    #   expect(subject.exit_station).to eq exit_station
    # end

    it 'will create a journey after touch in and touch out' do
      subject.top_up(2)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.journeys.length).to eq(1)
    end
  end
end 

