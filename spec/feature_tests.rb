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
new_card
add_money
save_entry_station
# irb -r './spec/feature_tests.rb'
