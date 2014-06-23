class Cms::CityConnectionsController < BackOfficeController

  before_filter :set_connection

  def show
    @city_connection_json = CityConnectionSerializer.new(@city_connection).to_json
  end

  def update
    params[:city_connection] = JSON.parse(params[:city_connection], symbolize_names: true)

    params[:city_connection][:twitter_accounts_attributes] = [] unless params[:city_connection][:twitter_accounts_attributes]
    
    params[:city_connection][:city_networks_attributes] = [] unless params[:city_connection][:city_networks_attributes]
    params[:city_connection][:city_resources_attributes] = [] unless params[:city_connection][:city_resources_attributes]
    
    city_networks = params[:city_connection][:city_networks_attributes]
    city_resources = params[:city_connection][:city_resources_attributes]

    city_networks.each do |city_network|
      # Copies the attached file to the correspondent network
      city_network[:logo] = params[city_network[:logo_name]] if city_network[:logo_name]
      city_network.delete(:logo_name)
      city_network.delete(:logo_url)
    end

    city_resources.each do |city_resource|
      # Copies the attached file to the correspondent resource
      city_resource[:logo] = params[city_resource[:logo_name]] if city_resource[:logo_name]
      city_resource.delete(:logo_name)
      city_resource.delete(:logo_url)
    end

    @city_connection.attributes = params[:city_connection]
    @city_connection.save!
    render status: :ok, nothing: true
  end

  private
  def set_connection
    @city_connection = CityConnection.first
  end

end