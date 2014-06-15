class Cms::CityConnectionsController < BackOfficeController

  before_filter :set_connection

  def show
  end

  def update
    @city_connection.attributes = params[:connection]
    @city_connection.save!
    render status: :ok, nothing: true
  end

  private
  def set_connection
    @city_connection = CityConnection.first
  end

end