require 'journey'

describe Journey do
    journey = Journey.new
  it 'should respond to #touch_in' do
    expect(journey).to respond_to(:touch_in)
  end
  it 'should respond to #touch_out' do
    expect(journey).to respond_to(:touch_out)
  end
  it 'is initiially not in journey' do
    expect(journey).not_to be_in_journey
  end
  it 'can #touch_in' do
    journey.touch_in
    expect(journey).to be_in_journey
  end
  it 'can #touch_out' do
    journey.touch_in
    journey.touch_out
    expect(journey).not_to be_in_journey
  end
end
