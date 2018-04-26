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

new_card
add_money
# irb -r './spec/feature_tests.rb'
