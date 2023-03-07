class CountryFacade
  def self.random_country_name
    countries = CountryService.countries.map do |country|
      country[:name][:common]
    end
    countries.shuffle.sample
  end

  def self.find_country(name)
    data = CountryService.find_country(name).first
    Country.new(data)
  end
end