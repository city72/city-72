class Cms::CitiesController < BackOfficeController

  empty_methods :show

  def update
    params[:city][:affiliates_attributes] = [] unless params[:city][:affiliates_attributes]
    @city.attributes = params[:city]
    @city.save
    render status: :ok, nothing: true
  end

end
