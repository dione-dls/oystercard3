class Journey

  attr_reader :current_journey, :entry_station

  def initialize
    @current_journey = { entry_station: nil, exit_station: nil}
    @entry_station = entry_station
  end

  def start_journey(entry_station)
    @entry_station = entry_station
    @current_journey[:entry_station] = entry_station
  end
end
