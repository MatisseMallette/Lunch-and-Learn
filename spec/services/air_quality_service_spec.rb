require 'rails_helper'

RSpec.describe 'AirQualityService' do
  describe 'successful response', :vcr do
    it 'returns data about the air quality' do
      data = AirQualityService.air_quality('19.43', '-99.13')

      expect(data).to be_an(Hash)
      expect(data[:coord]).to have_key(:lon)
      expect(data[:coord]).to have_key(:lat)
      expect(data[:list].first).to have_key(:dt)
      expect(data[:list].first[:main]).to have_key(:aqi)
    end
  end
end