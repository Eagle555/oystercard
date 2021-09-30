require 'station'

describe Station do
  let(:station) {described_class.new("Old Street", 1)} 

  it "has a name" do 
    expect(station.name).to eq("Old Street")
  end

  it "has a zone" do
    expect(station.zone).to eq 1
  end 
end 
