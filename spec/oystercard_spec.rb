require 'oystercard'
require 'journey'

describe Oystercard do

  subject(:card) { described_class.new }
  let(:entry_station) {entry_station}
  let(:exit_station) {entry_station}

  describe '#initialize' do
    it 'should have £0 #balance on setup' do
      expect(card.balance).to eq 0
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

    describe '#touch_in error' do
      let(:entry_station) { 'Station A' }
      let(:exit_station) { 'Station B' }
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
    end
end
