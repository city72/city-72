class Cms::CityConnectionsController < BackOfficeController

  before_filter :set_connection

  def show
    @city_connection_json = CityConnectionSerializer.new(@city_connection).to_json
    @all_networks_json = ActiveModel::ArraySerializer.new(CityNetwork.all, each_serializer: CityNetworkSerializer).to_json
  end

  def update
    params[:city_connection][:twitter_accounts_attributes] = [] unless params[:city_connection][:twitter_accounts_attributes]
    @city_connection.attributes = params[:city_connection]
    @city_connection.save!
    render status: :ok, nothing: true
  end

  private
  def set_connection
    @city_connection = CityConnection.first
  end

end