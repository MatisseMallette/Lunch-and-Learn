require 'rails_helper'

RSpec.describe "Api::V1::AirQuality", type: :request do
  describe "air quality get" do
    it "returns current air quality for country" do
      get api_v1_air_quality_path(country: "Mexico")

      expect(response).to be_successful

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      binding.pry
    end
  end
end
