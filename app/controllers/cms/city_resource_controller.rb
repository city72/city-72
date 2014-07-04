class Cms::CityResourceController < BackOfficeController

  def update
    @city_resource = CityResource.find(params[:id])
    @city_resource.logo = params[:logo]
    if @city_resource.save
      render status: :ok, json: @city_resource
    else
      render status: 422, json: @city_resource.errors
    end
  end

end