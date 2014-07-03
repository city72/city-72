class Cms::PlansController < BackOfficeController

  def show
    @quick_guide = QuickGuide.where("custom").first
  end

  def update
    @quick_guide = QuickGuide.where("custom").first
    custom_quick_guide_attributes = params.delete("quick_guide")
    if @quick_guide.update_attributes(custom_quick_guide_attributes)
      if @city.plan.update_attributes(params[:plan])
        flash[:notice] = "All data were successfully updated."
        redirect_to :action => "show"
      else
        flash[:error] = "There was an error uploading the changes, please try again."
        render :show
      end
    else
      flash[:error] = "The custom quick guide is not valid."
      render :show
    end
  end

end