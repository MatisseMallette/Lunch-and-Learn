require 'rails_helper'

RSpec.describe 'Recipe Service' do
  describe 'successful response', vcr: { record: :new_episodes }  do
    it 'it returns data about a recipe' do
      response = RecipeService.find_by_country('Mexico')
      
      expect(response).to be_an(Hash)
      expect(response).to have_key(:hits)
      expect(response[:hits]).to be_an(Array)
      expect(response[:hits].present?).to eq(true)

      response[:hits].each do |recipes|
        expect(recipes).to be_an(Hash)
        expect(recipes).to have_key(:recipe)

        expect(recipes[:recipe]).to have_key(:label)
        expect(recipes[:recipe][:label]).to be_a(String)
        expect(recipes[:recipe]).to have_key(:image)
        expect(recipes[:recipe][:image]).to be_a(String)
        expect(recipes[:recipe]).to have_key(:url)
        expect(recipes[:recipe][:url]).to be_a(String)
      end
    end
  end
end
