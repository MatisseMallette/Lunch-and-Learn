class ImageService
  def self.conn
    Faraday.new(url: 'https://api.unsplash.com/search/photos') do |f|
      f.params['client_id'] = ENV['UNSPLASH_APP_KEY']
    end
  end

  def self.find_by_country(country)
    response = conn.get do |f|
      f.params['query'] = country
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end

