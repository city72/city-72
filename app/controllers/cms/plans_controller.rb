class Cms::PlansController < BackOfficeController

  empty_methods :show

  def update
    if @city.plan.update_attributes(params[:plan])
      redirect_to :action => "show"
    else
      render :show
    end
  end

end