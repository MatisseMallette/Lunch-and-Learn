class RecipeService
  def self.conn
    Faraday.new(url: 'https://api.edamam.com/api/recipes/v2?type=public') do |f|
      f.params['app_id'] = ENV['EDAMAM_APP_ID']
      f.params['app_key'] = ENV['EDAMAM_APP_KEY']
    end
  end

  def self.find_by_country(country)
    response = conn.get do |f|
      f.params['q'] = country
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end