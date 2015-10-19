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

  it 'is expected to have a maximum top-up limit of £90' do
    expect(Oystercard::LIMIT).to eq 90
  end

  it 'should not let you top up so that your balance is not more than 90' do
    error = "Maximum top-up exceeded. Limit is #{Oystercard::LIMIT}"
    expect { subject.top_up(91) }.to raise_error error
  end

end
