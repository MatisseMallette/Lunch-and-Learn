class Recipe
  attr_reader :title, :image, :url, :country, :id
  def initialize(data, country)
    @id = nil
    @title = data[:label]
    @image = data[:image]
    @url = data[:url]
    @country = country
  end
end