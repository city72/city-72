class Cms::CitiesController < BackOfficeController

  before_filter :set_city

  def show
  end

  def update
    @city.attributes = params[:city]
    @city.save
    render :show
  end

  private
  def set_city
    @city = City.first
    raise "Corrupt Database" if @city.nil?
  end

end
