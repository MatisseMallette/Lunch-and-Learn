require 'rails_helper'

RSpec.describe "Api::V1::Favorites", type: :request do
  before :each do
    @user = User.create!(name: 'Jeff', email: 'jeff@gmail.com')
  end
  describe 'favorite post' do
    it 'can create a favorite for a user' do
      favorite_params = {
        api_key: @user.api_key,
        country: 'mexico',
        recipe_link: 'https://www.example.com',
        recipe_title: 'Gumbo'
      }
      headers = { 'CONTENT_TYPE' => 'application/json' }

      post api_v1_favorites_path, headers: headers, params: JSON.generate(favorite_params)
      
      expect(response.status).to eq(201)
      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response[:success]).to eq('Favorite added successfully')
    end
  end
end
