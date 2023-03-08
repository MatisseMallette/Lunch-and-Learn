require 'rails_helper'

RSpec.describe 'Api::V1::Favorites', type: :request do
  before :each do
    @user = User.create!(name: 'Jeff', email: 'jeff@gmail.com')
    @user.favorites.create!({
                              country: 'thailand',
                              recipe_title: 'Test Favorite',
                              recipe_link: 'https://www.testurl.com'
                            })

    @user.favorites.create!({
                              country: 'finland',
                              recipe_title: 'Test Favorite 2',
                              recipe_link: 'https://www.testurl2.com'
                            })

    @user.favorites.create!({
                              country: 'sweden',
                              recipe_title: 'Test Favorite 3',
                              recipe_link: 'https://www.testurl3.com'
                            })
  end

  describe 'post favorite' do
    it 'create user favorite' do
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

  describe 'get favorites' do
    it 'returns users favorites' do
      get api_v1_favorites_path(api_key: @user.api_key)

      expect(response.status).to eq(200)
      parsed_response = JSON.parse(response.body, symbolize_names: true)

      parsed_response[:data].each do |favorite|
        db_favorite = Favorite.find(favorite[:id])
        expect(favorite[:type]).to eq('favorite')
        expect(favorite[:attributes][:recipe_link]).to eq(db_favorite.recipe_link)
        expect(favorite[:attributes][:recipe_title]).to eq(db_favorite.recipe_title)
        expect(favorite[:attributes][:country]).to eq(db_favorite.country)
        expect(favorite[:attributes][:created_at]).to eq(db_favorite.created_at)
      end
    end
  end
end
