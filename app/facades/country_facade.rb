class CountryFacade
  def self.random_country_name
    countries = Rails.cache.fetch('countries', expires_in: 1.week) do
      CountryService.countries.map do |country|
        country[:name][:common]
      end
    end
    countries.shuffle.sample
  end

  def self.find_country(name)
    data = CountryService.country(name).first
    Country.new(data)
  end
end