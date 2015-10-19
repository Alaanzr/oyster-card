require 'oystercard'

describe Oystercard do

  describe '#initialize' do
    it 'is expected to initialize with a default balance of 0' do
      expect(subject.balance).to eq(0)
    end
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }
    it 'should top up by any amount' do
      subject.top_up(10)
      expect(subject.balance).to eq 10
    end
  end

  describe '# deduct' do
    it { is_expected.to respond_to(:deduct).with(1).argument}
    it 'deducts an amount' do
      expect{ subject.deduct(1) }.to change{subject.balance}.by(-1)
    end
  end


  context 'when a card is being tapped in/out' do
    before { subject.top_up(Oystercard::BALANCE_LIMIT) }
    it { is_expected.to respond_to(:touch_in).with(1).argument }
    it { is_expected.to respond_to(:in_journey?) }
    it 'expects the card to be in use' do
      subject.touch_in(Barrier.new)
      expect(subject).to be_in_journey
    end

    it { is_expected.to respond_to(:touch_out).with(1).argument }
    it 'expects the card not to be in use' do
      subject.touch_in(Barrier.new)
      subject.touch_out(Barrier.new)
      expect(subject).not_to be_in_journey
    end
  end

  describe '#touch_in' do
    it 'expects a minimum balance of £1' do
      expect { subject.touch_in(Barrier.new) }.to raise_error 'Insufficient funds'
    end
  end

end
