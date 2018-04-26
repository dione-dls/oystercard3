require './lib/oystercard.rb'

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

# new_card
# add_money
# save_entry_station
# save_exit_station

create_station

# irb -r './spec/feature_tests.rb'
