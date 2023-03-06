class VideoService
  def self.conn
    Faraday.new(url: 'https://www.googleapis.com/youtube/v3/search') do |f|
      f.params['key'] = ENV['GOOGLE_API_KEY']
      f.params['part'] = 'snippet'
    end
  end

  def self.find_by_country(country)
    response = conn.get do |f|
      f.params['q'] = country
      f.params['channelId'] = 'UCluQ5yInbeAkkeCndNnUhpw'
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
