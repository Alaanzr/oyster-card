require 'oystercard'

describe Oystercard do
  
  it 'is expected to initialize with a default balance of 0' do
    expect(subject.balance).to eq(0)
  end


end
