require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }

  describe '#initialize' do
    it 'is expected to initialize with a default balance of 0' do
      expect(oystercard.balance).to eq(0)
    end
  end

  describe '#top_up' do
    it 'should top up by any amount' do
      oystercard.top_up(10)
      expect(oystercard.balance).to eq 10
    end
  end

  context 'when a card is being tapped in/out' do
    before { oystercard.top_up(Oystercard::BALANCE_LIMIT) }
    it 'expects the card to be in use' do
      oystercard.touch_in(Barrier.new)
      expect(oystercard).to be_in_journey
    end

    it 'expects the card not to be in use' do
      oystercard.touch_in(Barrier.new)
      oystercard.touch_out(Barrier.new)
      expect(oystercard).not_to be_in_journey
    end
  end

  describe '#touch_in' do
    it 'expects a minimum balance of £1' do
      expect { oystercard.touch_in(Barrier.new) }.to raise_error 'Insufficient funds'
    end
  end

  describe '#touch_out' do
    it 'reduces the balance by the minimum fare' do
    oystercard.top_up(described_class::MINIMUM_BALANCE)
    oystercard.touch_in(Barrier.new)
    expect { oystercard.touch_out(Barrier.new) }.to change { oystercard.balance }.by(-(described_class::MINIMUM_BALANCE))
  end
end

end
