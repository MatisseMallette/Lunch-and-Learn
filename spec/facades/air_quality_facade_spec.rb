require 'rails_helper'

RSpec.describe 'Air Quality Facade' do
  describe 'returns usuable air quality data', :vcr do
    it 'returns an AirQuality object from a country name' do
      air_quality = AirQualityFacade.find_air_quality('19.43', '-99.13')

    expect(air_quality.id).to eq(nil)
      expect(air_quality.aqi).to eq(4)
      expect(air_quality.aqi).to be_an(Integer)
      expect(air_quality.datetime).to eq(1678227867)
      expect(air_quality.datetime).to be_an(Integer)
      expect(air_quality.readable_aqi).to eq('Poor')
      expect(air_quality.readable_aqi).to be_a(String)
    end

    it 'can convert readable_aqi integer into string' do
      readable_air_quality_string = AirQualityFacade.readable_aqi[1]
      expect(readable_air_quality_string).to eq('Good')
    end
  end
end
