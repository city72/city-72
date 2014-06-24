class Cms::AboutsController < BackOfficeController

  before_filter :set_about

  empty_methods :show

  def update
    @about.attributes = params[:about]
    @about.image = params[:image]
    @about.logo = params[:logo]
    if @about.save
      flash[:notice] = "All data were successfully updated."
      redirect_to :action => "show"
    else
      flash[:error] = "There was an error uploading the changes, please try again."
      render :show
    end
  end

  private
  def set_about
    @about = About.first
  end

end