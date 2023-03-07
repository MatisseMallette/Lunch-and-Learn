class AirQuality
  attr_reader :id, :aqi, :datetime, :readable_aqi
  def initialize(info, readable_aqi)
    @id = nil
    @aqi = info[:list].first[:main][:aqi]
    @datetime = info[:list].first[:dt]
    @readable_aqi = readable_aqi
  end
end