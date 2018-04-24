class Oystercard
  attr_reader :balance
  LIMIT = 90
  MINIMUM_VALUE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

  def top_up(value)
    raise "Maximum limit of £#{LIMIT} exceeded" if @balance + value > LIMIT
    @balance += value
  end

  def deduct(value)
    raise "Invalid amount" if value < 0
    @balance -= value
  end

  def touch_in
    raise "Minimum card balance required" if @balance < MINIMUM_VALUE
    @in_journey = true
  end

  def touch_out
    deduct(MINIMUM_VALUE)
    @in_journey = false
  end
end
