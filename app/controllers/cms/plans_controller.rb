class Cms::PlansController < BackOfficeController

  empty_methods :show

  def update
    @city.plan.update_attributes(params[:plan])
    render :show
  end

end