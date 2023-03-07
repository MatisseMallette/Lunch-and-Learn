class AirQualityFacade
  def self.find_air_quality(lat, lng)
    data = AirQualityService.air_quality(lat, lng)
    aqi = data[:list].first[:main][:aqi]
    AirQuality.new(data, readable_aqi[aqi])
  end

  def self.readable_aqi
    {
      1 => 'Good',
      2 => 'Fair',
      3 => 'Moderate',
      4 => 'Poor',
      5 => 'Very Poor'
    }
  end
end
