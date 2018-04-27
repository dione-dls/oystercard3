require_relative './journey.rb'

class Oystercard
  attr_reader :balance, :journey, :journey_history

  LIMIT = 90
  MINIMUM_VALUE = 1

  def initialize#(journey = Journey.new)
    @balance = 0
    # @journey = { entry_station: nil, exit_station: nil }
    @journey_history = []
    @journey = journey
  end

  # def in_journey?
  #   @entry_station != nil
  # end

  def top_up(value)
    raise "Maximum limit of £#{LIMIT} exceeded" if @balance + value > LIMIT
    @balance += value
  end

  def touch_in(entry_station)
    raise "Minimum card balance required" if @balance < MINIMUM_VALUE
    @journey[:entry_station] = entry_station
  end

  def touch_out(exit_station)
      deduct(MINIMUM_VALUE)
      @journey[:exit_station] = exit_station
      # @entry_station = nil
  end

  private

  def deduct(value)
    raise "Invalid amount" if value < 0
    @balance -= value
  end

end
