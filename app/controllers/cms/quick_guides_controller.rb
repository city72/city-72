class Cms::QuickGuidesController < BackOfficeController

  def show
    @quick_guide = QuickGuide.where("custom").first
  end

  def update
    @quick_guide = QuickGuide.where("custom").first
    if @quick_guide.update_attributes(params[:quick_guide])
      flash[:notice] = "All data were successfully updated."
      redirect_to :action => "show"
    else
      flash[:error] = "There was an error uploading the changes, please try again."
      render :show
    end
  end

end