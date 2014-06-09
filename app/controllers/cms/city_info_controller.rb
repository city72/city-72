class Cms::CityInfoController < BackOfficeController

  def index
    @city = City.first
    raise "Corrupt Database" if @city.nil?

  end

end