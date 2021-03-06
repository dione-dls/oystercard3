class Journey

  attr_reader :current_journey, :journey_history

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize
    @current_journey = { entry_station: nil, exit_station: nil}
    @journey_history = []
    # @entry_station = entry_station
    # @exit_station = exit_station
  end

  def start_journey(entry_station)
    # @entry_station = entry_station
    @current_journey[:entry_station] = entry_station
  end

  def end_journey(exit_station)
    # @exit_station = exit_station
    @current_journey[:exit_station] = exit_station
  end

  def complete?
      complete_journey
#    !!@entry_station && !!@exit_station
#    true
  end

  def complete_journey
    if (@current_journey[:entry_station] && @current_journey[:exit_station])
      then true
    else
      false
    end
  end

  def fare
    (@current_journey[:entry_station].nil? || @current_journey[:exit_station].nil? ) ? PENALTY_FARE : MINIMUM_FARE
  end

  def add(current_journey)
    @journey_history << @current_journey
    @journey_history
  end
end
