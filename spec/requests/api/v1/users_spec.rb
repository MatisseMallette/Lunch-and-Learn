require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  describe 'user post request' do
    it 'can create a user' do

      user_params = {
        name: 'jeff',
        email: 'jeff@gmail.com'
      }

      headers = { 'CONTENT_TYPE' => 'application/json' }

      post api_v1_users_path, headers: headers, params: JSON.generate(user_params)

      expect(response).to be_successful
      parsed_response = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_response[:data][:attributes][:name]).to eq(user_params[:name])
      expect(parsed_response[:data][:attributes][:email]).to eq(user_params[:email])
      expect(parsed_response[:data][:attributes]).to have_key(:api_key)

      created_user = User.last

      expect(created_user.name).to eq('jeff')
      expect(created_user.email).to eq('jeff@gmail.com')
      expect(created_user.api_key.length).to eq(32)
      expect(created_user.api_key).to be_a(String)
    end

    it 'returns an error if a parameter is missing' do

      user_params = {
        email: 'jeff@gmail.com'
      }

      headers = { 'CONTENT_TYPE' => 'application/json' }

      post api_v1_users_path, headers: headers, params: JSON.generate(user_params)

      expect(response).to_not be_successful
      
      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(422)
    end

    #TODO: Can't be created if user is duplicate, if given an incorrectly formatted email
  end
end
