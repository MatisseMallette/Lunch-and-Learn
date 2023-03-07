require 'rails_helper'

RSpec.describe 'AirQuality' do
  describe 'existence' do
    it 'exists' do 
      response = File.read('spec/fixtures/current_air_pollution_response.json')
      data = JSON.parse(response, symbolize_names: true)
      air_quality = AirQuality.new(data, 'Poor')


      expect(air_quality.id).to eq(nil)
      expect(air_quality.aqi).to eq(4)
      expect(air_quality.aqi).to be_an(Integer)
      expect(air_quality.datetime).to eq(1678224114)
      expect(air_quality.datetime).to be_an(Integer)
      expect(air_quality.readable_aqi).to eq('Poor')
      expect(air_quality.readable_aqi).to be_a(String)
    end
  end
end