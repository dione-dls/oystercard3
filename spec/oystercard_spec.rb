require 'oystercard'

describe Oystercard do
  it 'should have £0 #balance on setup' do
    expect(subject.balance).to eq 0
  end

  it '#in_journey? should be false' do
    expect(subject.in_journey?).to eq false
  end

  it 'should have an empty @journey_history' do
    expect(subject.journey_history).to be_empty
  end

  describe '#top_up' do
    it 'adds money to the balance of the card' do
      subject.top_up(5)
      expect(subject.balance).to eq 5
    end

    it 'raises an error during top-up when the balance exceeds 90' do
      expect { subject.top_up(Oystercard::LIMIT + 1)
      }.to raise_error "Maximum limit of £#{Oystercard::LIMIT} exceeded"
    end

    it 'expects balance to equal limit constant' do
      subject.top_up(90)
      expect(subject.balance).to eq Oystercard::LIMIT
    end
  end

  context 'card usage during the journey' do
    let(:entry_station) { 'Station A' }
    let(:exit_station) { 'Station B' }

    def top_up_touch_in
      subject.top_up(10)
      subject.touch_in(entry_station)
    end

    describe '#touch_in method' do
      it 'should respond to #touch_in' do
        top_up_touch_in
        expect(subject.in_journey?).to eq true
      end

      it 'should raise an error when balance is below minimum' do
        expect { subject.touch_in(entry_station) }.to raise_error RuntimeError
      end
    end

    describe '#touch_out method' do
      it 'should respond to #touch_out' do
        top_up_touch_in
        subject.touch_out(exit_station)
        expect(subject.in_journey?).to eq false
      end

      it 'should reduce card balance by the minimum fare' do
        top_up_touch_in
        expect{ subject.touch_out(exit_station) }.to change{ subject.balance }.by(-Oystercard::MINIMUM_VALUE)
      end

      it 'should record the journey' do
        top_up_touch_in
        subject.touch_out(exit_station)
        expect(subject.journey_history.length).to eq 1
      end
    end

    describe '#in_journey?' do
      it 'should respond to #in_journey?' do
        expect(subject).to respond_to(:in_journey?)
      end

      it 'returns a boolean value' do
        expect(subject).not_to be_in_journey
      end
    end

    # describe 'stores journey history' do
    #
    #   it 'should have a record of that journey\'s history' do
    #     subject.top_up(5)
    #     subject.touch_in(entry_station)
    #     expect(subject.history).to include(entry_station)
    #   end
    # end
  end
end
