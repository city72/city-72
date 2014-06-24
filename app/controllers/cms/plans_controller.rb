class Cms::PlansController < BackOfficeController

  empty_methods :show

  def update
    if @city.plan.update_attributes(params[:plan])
      flash[:notice] = "All data were successfully updated."
      redirect_to :action => "show"
    else
      flash[:error] = "There was an error uploading the changes, please try again."
      render :show
    end
  end

end