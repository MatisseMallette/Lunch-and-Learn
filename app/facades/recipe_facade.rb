class RecipeFacade
  def self.find_by_country(country)
    recipes = RecipeService.find_by_country(country)[:hits]
    recipes.map do |recipe|
      Recipe.new(recipe[:recipe], country)
    end
  end
end