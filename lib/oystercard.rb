class Oystercard
  attr_reader :balance, :entry_station, :journey_history

  LIMIT = 90
  MINIMUM_VALUE = 1

  def initialize
    @balance = 0
    @journey_history = {}
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
  end

  def touch_out(exit_station)
    deduct(MINIMUM_VALUE)
    @journey_history[entry_station] = exit_station
    @entry_station = nil
  end

  private

  def deduct(value)
    raise "Invalid amount" if value < 0
    @balance -= value
  end
end
