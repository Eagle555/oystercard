require 'journey'

describe Journey do 
  let(:station) { double :station, zone: 1}

  #saying the station is a variable containing a mock/double of the station class
  #this object has an instance property called zone, with the value of 1. 

  it "knows that the journey is not complete" do
    expect(subject).not_to be_complete
  end 

  it 'has a penalty fare by default' do
    expect(subject.fare).to eq(Journey::MINIMUM_FARE)
  end 

  it 'returns itself when exiting a journey' do
    expect(subject.finish(station)).to eq(subject)
  end 

  context "given an entry station " do
    subject {described_class.new(entry_station: station)}
  end 
  #what does this mean? key station 

  # it 'has an entry station' do 
  #   expect(subject.entry_station).to eq station
  # end 

  #entry_station
end 

