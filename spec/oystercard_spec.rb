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
end
