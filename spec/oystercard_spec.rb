require 'oystercard'

describe Oystercard do

  subject(:card) { described_class.new }
  let(:entry_station) {entry_station}
  let(:exit_station) {entry_station}

  describe '#initialize' do
    it 'should have £0 #balance on setup' do
      expect(card.balance).to eq 0
    end
    it 'should have an empty journey' do
      journey_init = { entry_station: nil, exit_station: nil }
      expect(card.journey).to eq journey_init
    end
  end

  describe '#top_up' do
    it 'adds money to the balance of the card' do
      card.top_up(5)
      expect(card.balance).to eq 5
    end
    it 'raises an error during top-up when the balance exceeds 90' do
      expect { card.top_up(Oystercard::LIMIT + 1)
      }.to raise_error "Maximum limit of £#{Oystercard::LIMIT} exceeded"
    end
  end

  context 'journey card usage' do
    let(:entry_station) { 'Station A' }
    let(:exit_station) { 'Station B' }

    describe '#touch_in method' do
      before do
        card.top_up(10)
        card.touch_in(entry_station)
      end
      it 'should respond to #touch_in' do
        expect(card.in_journey?).to eq true
      end
      it 'should save the entry station in the journey' do
        start_journey = { entry_station: entry_station, exit_station: nil}
        expect(card.journey).to eq start_journey
      end
    end

    describe '#touch_in error' do
      it 'should raise an error when balance is below minimum' do
        expect { card.touch_in(entry_station) }.to raise_error RuntimeError
      end
    end

    describe '#touch_out method' do
      before do
        card.top_up(10)
        card.touch_in(entry_station)
        card.touch_out(exit_station)
      end
      it 'should save the exit station' do
        end_journey = { entry_station: entry_station, exit_station: exit_station }
        expect(card.journey).to eq end_journey
      end
      it 'should store the journey in the journey history' do
        end_journey = { entry_station: entry_station, exit_station: exit_station }
        expect(card.journey_history).to include end_journey
      end
      it 'should reduce card balance by the minimum fare' do
        card.top_up(10)
        card.touch_in(entry_station)
        expect{ card.touch_out(exit_station) }.to change{ card.balance}.by(-Oystercard::MINIMUM_VALUE)
      end
    end

  end

end
