class AirQualityService
  def self.conn
    Faraday.new(url: 'http://api.openweathermap.org/data/2.5/') do |f|
      f.params[:appid] = ENV['OPENWEATHERMAP_API_KEY']
    end
  end

  def self.air_quality(lat, lon)
    response = conn.get("air_pollution") do |f|
      f.params[:lat] = lat
      f.params[:lon] = lon

    end
    JSON.parse(response.body, symbolize_names: true)
  end
end