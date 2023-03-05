class CountryFacade
  def self.random_country
    countries = CountryService.countries.map do |country|
      country[:name][:common]
    end
    countries.shuffle.sample
  end
end