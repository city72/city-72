class Cms::PlansController < BackOfficeController

  def show
    @quick_guide = QuickGuide.where("custom").first
  end

  def update
    @quick_guide = QuickGuide.where("custom").first
    custom_quick_guide_attributes = params.delete("quick_guide")
    if @quick_guide.update_attributes(custom_quick_guide_attributes)
      if @city.plan.update_attributes(params[:plan])
        flash[:notice] = "Your changes were saved."
        redirect_to :action => "show"
      else
        flash[:error] = "Sorry. Your changes could not be saved. Please try again"
        render :show
      end
    else
      flash[:error] = "Sorry. Your changes could not be saved. The custom quick guide is not valid."
      render :show
    end
  end

end