require 'journey'

describe Journey do
  subject(:journey) {described_class.new}
  let(:entry_station) {double :entry_station}
  let(:exit_station) {double :exit_station}

  it 'should respond to start_journey' do
    expect(journey).to respond_to(:start_journey)
  end

  describe '#initialize' do
    it 'should have an empty journey' do
      journey_init = { entry_station: nil, exit_station: nil }
      expect(journey.current_journey).to eq journey_init
    end
  end

  describe '#start_journey' do
    it 'should save the entry station' do
      journey.start_journey(entry_station)
      expect(journey.entry_station).to eq entry_station
    end

    it 'should record entry_station to the current_journey' do
      journey.start_journey(entry_station)
      start_journey = { entry_station: entry_station, exit_station: nil}
      expect(journey.current_journey).to eq start_journey
    end
  end


    # it 'should save the entry station in the journey' do
    #   journey.start_journey(entry_station)
    #   start_journey = { entry_station: entry_station, exit_station: nil }
    #   expect(journey.current_journey).to eq start_journey
    #end
  #end
end
