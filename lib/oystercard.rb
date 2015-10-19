class Oystercard

attr_reader :balance

LIMIT = 90

  def initialize(balance=0)
    @balance = balance
  end

  def top_up(amount)
    raise "Maximum top-up exceeded. Limit is #{Oystercard::LIMIT}" if (@balance + amount) > 90
    @balance += amount
  end
end
