class Cms::CityConnectionsController < BackOfficeController

  before_filter :set_connection

  def show
    respond_to do |format|
      format.html {
        @city_connection_json = CityConnectionSerializer.new(@city_connection).to_json
      }
      format.json {
        render status: :ok, json: CityConnectionSerializer.new(@city_connection).to_json
      }
    end
  end

  def update
    params[:city_connection] = JSON.parse(params[:city_connection], symbolize_names: true)

    params[:city_connection][:twitter_accounts_attributes] = [] unless params[:city_connection][:twitter_accounts_attributes]

    params[:city_connection][:city_networks_attributes] = [] unless params[:city_connection][:city_networks_attributes]
    params[:city_connection][:city_resources_attributes] = [] unless params[:city_connection][:city_resources_attributes]

    @city_connection.attributes = params[:city_connection]
    if @city_connection.save
      render status: :ok, json: @city_connection
    else
      render status: 422, json: @city_connection.errors
    end
  end

  private
  def set_connection
    @city_connection = CityConnection.first
  end

end