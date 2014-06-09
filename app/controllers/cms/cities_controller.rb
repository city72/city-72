class Cms::CitiesController < BackOfficeController

  before_filter :set_city

  def show
  end

  def update
    @city.update_attributes(params[:city])
    render :show
  end

  def set_city
    @city = City.first
    raise "Corrupt Database" if @city.nil?
  end

end
