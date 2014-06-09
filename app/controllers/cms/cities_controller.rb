class Cms::CitiesController < BackOfficeController

  def show
    @city = City.first
    raise "Corrupt Database" if @city.nil?
  end

end
