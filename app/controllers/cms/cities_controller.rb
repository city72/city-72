class Cms::CitiesController < BackOfficeController

  before_filter :set_city

  def show
  end

  def update
    params[:city][:affiliates_attributes] = [] unless params[:city][:affiliates_attributes]
    @city.attributes = params[:city]
    @city.save
    render status: :ok, nothing: true
  end

  private
  def set_city
    @city = City.first
    raise "Corrupt Database" if @city.nil?
  end

end
