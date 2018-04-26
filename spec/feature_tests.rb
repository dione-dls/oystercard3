require './lib/oystercard.rb'
require './lib/journey.rb'

def new_card
  oystercard = Oystercard.new
  p oystercard
end

def add_money
  oystercard = Oystercard.new
  oystercard.top_up(5)
  p oystercard
end

def one_journey
  oystercard = Oystercard.new
  p oystercard
end

def save_entry_station
  oystercard = Oystercard.new
  oystercard.top_up(5)
  oystercard.touch_in('Aldgate')
  p oystercard
end

def save_exit_station
  oystercard = Oystercard.new
  oystercard.top_up(5)
  oystercard.touch_in('Aldgate')
  oystercard.touch_out('Waterloo')
  p oystercard
end

def create_station
  station = Station.new
  p station
end

def new_journey
  journey = Journey.new
  p journey
end

def record_start_journey
  journey = Journey.new
  journey.start_journey('Station 1')
  p journey
end

def end_journey
  journey = Journey.new
  journey.start_journey('Station 1')
  journey.end_journey('Station 2')
  p journey
end

def journey_complete
  journey = Journey.new
  journey.start_journey('Station 1')
  journey.end_journey('Station 2')
  journey.complete?
  p journey
end

def return_minimum_fare
  journey = Journey.new
  journey.start_journey('Station 1')
  journey.end_journey('Station 2')
  p journey.fare
  p journey
end

def incomplete_journey
  journey = Journey.new
  journey.end_journey('Station 2')
  p journey.fare
  p journey
end

new_card
# add_money
# save_entry_station
# save_exit_station
#create_station
# new_journey
record_start_journey
# end_journey
# return_minimum_fare
# incomplete_journey

# irb -r './spec/feature_tests.rb'
