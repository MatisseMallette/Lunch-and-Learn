require 'rails_helper'

RSpec.describe 'Country Service' do
  describe 'successful response', :vcr do
    it 'it returns data about a country' do
      data = CountryService.country('Mexico').first

      expect(data).to be_a(Hash)

      expect(data[:name]).to be_a(Hash)
      expect(data[:name]).to have_key(:common)
      expect(data[:name][:common]).to be_a(String)

      expect(data).to have_key(:capital)
      expect(data[:capital]).to be_a(Array)
      expect(data[:capital].count).to eq(1)
      expect(data[:capital][0]).to be_a(String)

      expect(data).to have_key(:capitalInfo)
      expect(data[:capitalInfo]).to be_a(Hash)
      expect(data[:capitalInfo]).to have_key(:latlng)
      expect(data[:capitalInfo][:latlng]).to be_a(Array)
      expect(data[:capitalInfo][:latlng].count).to eq(2)
      expect(data[:capitalInfo][:latlng].first).to be_a(Float)
      expect(data[:capitalInfo][:latlng].last).to be_a(Float)
    end
  end
end
