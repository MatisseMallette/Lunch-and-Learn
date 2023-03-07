class Api::V1::AirQualityController < ApplicationController
  def show
    country = CountryFacade.find_country(air_quality_params[:country])
    air_quality = AirQualityFacade.find_air_quality(country.capital_latitude, country.capital_longitude)
    render json: AirQualitySerializer.new(air_quality)
  end

  private

  def air_quality_params
    params.permit(:country)
  end
end
