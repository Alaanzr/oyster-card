class Oystercard

attr_reader :balance, :in_use

BALANCE_LIMIT = 90
MINIMUM_BALANCE = 1

  def initialize(balance=0)
    @balance = balance
    @in_use = false
  end

  def top_up(amount)
    raise "Maximum top-up exceeded. Limit is #{Oystercard::LIMIT}" if (@balance + amount) > 90
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in(barrier)
    raise 'Insufficient funds' if @balance < MINIMUM_BALANCE
    @in_use = true
    "Please enter"
  end

  def touch_out(barrier)
    @in_use = false
    "Please exit"
  end

  def in_journey?
    @in_use
  end

end
