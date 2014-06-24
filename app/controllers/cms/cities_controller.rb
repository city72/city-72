class Cms::CitiesController < BackOfficeController

  empty_methods :show

  def update
    params[:city] = JSON.parse(params[:city], symbolize_names: true)
    params[:city][:affiliates_attributes] = [] unless params[:city][:affiliates_attributes]
    @city.attributes = params[:city].except(:id, :affiliates, :image_url, :resident_image_url)
    if params[:city_image]
      @city.image = params[:city_image]
    end
    if params[:resident_image]
      @city.resident_image = params[:resident_image]
    end
    @city.save
    render status: :ok, json: @city
  end

end
