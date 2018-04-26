class Journey

  attr_reader :current_journey

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize
    @current_journey = { entry_station: nil, exit_station: nil}
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
    if @current_journey[:entry_station] == nil || @current_journey[:exit_station] == nil then false else true
    end
  end

  def fare
    if @current_journey[:entry_station] == nil || @current_journey[:exit_station] == nil then PENALTY_FARE else MINIMUM_FARE
    end
  end
end
