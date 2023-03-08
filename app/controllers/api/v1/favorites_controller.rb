class Api::V1::FavoritesController < ApplicationController
  def create
    user = User.find_by!(api_key: favorite_api_key_params[:api_key])
    user.favorites.new(favorite_params).save!
    render json: { success: 'Favorite added successfully' }, status: :created
  rescue StandardError => e
    render json: ErrorSerializer.serialize(e), status: :unprocessable_entity
  end

  private

  def favorite_api_key_params
    params.permit(:api_key)
  end

  def favorite_params
    params.permit(:country, :recipe_link, :recipe_title)
  end
end
