require 'rails_helper'

RSpec.describe "Api::V1::LearningResources", type: :request do
  describe 'learning resources get' do
    describe 'get a resource for a country', :vcr do
      it 'returns a resource for a country passed in' do
        get api_v1_learning_resources_path(country: 'Mexico')

        expect(response).to be_successful

        data = JSON.parse(response.body, symbolize_names: true)[:data]
 
        expect(data[:id]).to eq(nil)
        expect(data[:type]).to eq('learning_resource')
        expect(data[:attributes][:video]).to have_key(:title)
        expect(data[:attributes][:video]).to have_key(:youtube_video_id)
        expect(data[:attributes][:images]).to be_a(Array)
        expect(data[:attributes][:images].first).to have_key(:url)
        expect(data[:attributes][:images].first).to have_key(:alt_tag)
        expect(data[:attributes][:country]).to eq('Mexico')
      end
    end
  end
end
