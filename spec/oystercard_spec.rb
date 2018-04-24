require 'oystercard'

describe Oystercard do
  it 'should have 0 #balance on instantiation' do
    expect(subject.balance).to eq 0
  end

  it 'should return false' do
    expect(subject.in_journey?).to eq false
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
    describe '#touch_in method' do
      it 'should respond to #touch_in' do
        subject.top_up(10)
        subject.touch_in
        expect(subject.in_journey?).to eq true
      end

      it 'should raise an error when balance is below minimum' do
        expect { subject.touch_in }.to raise_error RuntimeError
      end
    end

    describe '#touch_out method' do
      it 'should respond to #touch_out' do
        subject.top_up(10)
        subject.touch_in
        subject.touch_out
        expect(subject.in_journey?).to eq false
      end

      it 'should reduce card balance by the minimum fare' do
        subject.top_up(10)
        subject.touch_in
        expect{ subject.touch_out }.to change{ subject.balance }.by(-Oystercard::MINIMUM_VALUE)
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
  end


end
