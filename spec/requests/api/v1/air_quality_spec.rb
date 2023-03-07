require 'rails_helper'

RSpec.describe "Api::V1::AirQuality", type: :request do
  describe "air quality get", :vcr do
    it "returns current air quality for country" do
      get api_v1_air_quality_path(country: "Mexico")

      expect(response).to be_successful

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response).to be_a(Hash)
      expect(parsed_response).to have_key(:data)
      expect(parsed_response[:data]).to be_a(Hash)

      parsed_response[:data] do |d|
        expect(d).to have_key(:id)
        expect(d[:id]).to be_a(String)
        expect(d[:id]).to eq('null')

        expect(d).to have_key(:type)
        expect(d[:type]).to be_a(String)
        expect(d[:type]).to eq('air_quality')

        expect(d).to have_key(:attributes)
        expect(d[:attributes]).to be_a(Hash)
        
        expect(d[:attributes]).to have_key(:aqi)
        expect(d[:attributes]).to have_key(:datetime)
        expect(d[:attributes]).to have_key(:readable_aqi)

        expect(d[:attributes][:aqi]).to be_a(Integer)
        expect(d[:attributes][:datetime]).to be_a(Integer)
        expect(d[:attributes][:readable_aqi]).to be_a(String)
      end
    end
  end
end
