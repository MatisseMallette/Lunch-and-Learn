require 'rails_helper'

RSpec.describe 'Recipes Requests', type: :request do
  describe 'recipes get' do
    describe 'get all recipes for a country', :vcr do
      it 'returns all recipes for a country passed in' do
        get api_v1_recipes_path(country: 'Thailand')

        expect(response).to be_successful

        parsed_response = JSON.parse(response.body, symbolize_names: true)

        expect(parsed_response[:data]).to be_a(Array)

        parsed_response[:data].each do |recipe|
          expect(recipe[:id]).to eq(nil)
          expect(recipe[:type]).to eq('recipe')
          expect(recipe[:attributes]).to have_key(:title)
          expect(recipe[:attributes]).to have_key(:image)
          expect(recipe[:attributes]).to have_key(:url)
          expect(recipe[:attributes][:country]).to eq('Thailand')
        end
      end

      it 'uses a random country if none is given' do
        get api_v1_recipes_path

        expect(response).to be_successful

        parsed_response = JSON.parse(response.body, symbolize_names: true)

        expect(parsed_response[:data]).to be_a(Array)

        country = parsed_response[:data].first[:attributes][:country]

        parsed_response[:data].each do |recipe|
          expect(recipe[:id]).to eq(nil)
          expect(recipe[:type]).to eq('recipe')
          expect(recipe[:attributes]).to have_key(:title)
          expect(recipe[:attributes]).to have_key(:image)
          expect(recipe[:attributes]).to have_key(:url)
          expect(recipe[:attributes][:country]).to eq(country)
        end
      end

      it 'will return an empty array if param is given but no text is given' do
        get api_v1_recipes_path(country: '')

        expect(response).to be_successful

        parsed_response = JSON.parse(response.body, symbolize_names: true)

        expect(parsed_response[:data]).to eq([])
      end
    end
  end
end
