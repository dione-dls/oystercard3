require './lib/station.rb'

describe Station do
  let (:name) { double :name }
  let (:zone) { double :zone }
  subject(:station) { described_class.new(name, zone) }


  describe '#initialize' do
    it 'has a name' do
      expect(station.name).to eq name
    end
    it 'has a zone' do
      expect(station.zone).to eq zone
    end
  end

end
