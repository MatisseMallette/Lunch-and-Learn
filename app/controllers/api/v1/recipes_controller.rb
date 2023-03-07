class Api::V1::RecipesController < ApplicationController
  def index
    params[:country] = CountryFacade.random_country_name unless recipe_params[:country]
    recipes = RecipeFacade.find_by_country(recipe_params[:country])
    render json: RecipeSerializer.new(recipes)
  end

  def recipe_params
    params.permit(:country)
  end
end
