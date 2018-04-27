require 'journey'

describe Journey do
  subject(:journey) {described_class.new}
  let(:entry_station) {double :entry_station}
  let(:exit_station) {double :exit_station}

  describe '#initialize' do
    it 'should have an empty journey' do
      journey_init = { entry_station: nil, exit_station: nil }
      expect(journey.current_journey).to eq journey_init
    end
  end

  describe '#start_journey' do
    before do
      journey.start_journey(entry_station)
    end
    it 'should record entry_station to the current_journey' do
      start_journey = { entry_station: entry_station, exit_station: nil}
      expect(journey.current_journey).to eq start_journey
    end
  end

  describe '#end_journey' do
    before do
      journey.start_journey(entry_station)
      journey.end_journey(exit_station)
    end
    it 'should record exit_station to the current_journey' do
      end_journey = { entry_station: entry_station, exit_station: exit_station}
      expect(journey.current_journey).to eq end_journey
    end
  end

  describe '#complete?' do
    it 'true when entry_station and exit_station are not nil' do
      journey.start_journey(entry_station)
      journey.end_journey(exit_station)
      expect(journey.complete?).to eq true
    end
    it 'should be false if the journey did not have an entry station' do
      journey.start_journey(nil)
      journey.end_journey(exit_station)
      expect(journey.complete?).to eq false
    end
  end

  describe 'starts a journey' do
    it 'has an entry station when journey starts' do
      expect( journey.start_journey(entry_station)).to eq entry_station
    end

  end

  describe '#fare' do
    it 'should return the minimum fare' do
      journey.start_journey(entry_station)
      journey.end_journey(exit_station)
      expect(journey.fare).to eq Journey::MINIMUM_FARE
    end
    it 'it should be the penalty fare if no exit station' do
      journey.start_journey(entry_station)
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end
  end

  describe '#add' do
    it 'adds the recent full journey to a list of journeys' do
      journey.start_journey(entry_station)
      journey.end_journey(exit_station)
      current_journey = { entry_station: entry_station, exit_station: exit_station}
      journey.add(current_journey)
      expect(journey.journey_history).to include current_journey
    end
  end
end
