class Cms::CityNetworkController < BackOfficeController

  def update
    @city_network = CityNetwork.find(params[:id])
    @city_network.logo = params[:logo]
    if @city_network.save
      render status: :ok, json: @city_network
    else
      render status: 422, json: @city_network.errors
    end
  end

end