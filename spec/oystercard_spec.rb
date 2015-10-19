require 'oystercard'

describe Oystercard do

  it 'is expected to initialize with a default balance of 0' do
    expect(subject.balance).to eq(0)
  end

  it { is_expected.to respond_to(:top_up).with(1).argument }
  it 'should top up by any amount' do
    subject.top_up(10)
    expect(subject.balance).to eq 10
  end

end
