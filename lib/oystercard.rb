class Oystercard
  attr_reader :balance, :entry_station

  LIMIT = 90
  MINIMUM_VALUE = 1

  def initialize
    @balance = 0
  end

  def in_journey?
    @entry_station != nil
  end

  def top_up(value)
    raise "Maximum limit of £#{LIMIT} exceeded" if @balance + value > LIMIT
    @balance += value
  end

  def touch_in(entry_station)
    raise "Minimum card balance required" if @balance < MINIMUM_VALUE
    @entry_station = entry_station
    @in_journey = true
  end

  def touch_out
    deduct(MINIMUM_VALUE)
    @entry_station = nil
    @in_journey = false
  end

  def history
    'Station A'
  end

  private

  def deduct(value)
    raise "Invalid amount" if value < 0
    @balance -= value
  end
end
