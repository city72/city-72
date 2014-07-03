class Cms::AboutsController < BackOfficeController

  before_filter :set_about

  empty_methods :show

  def update
    @about.attributes = params[:about]
    @about.image = params[:image]
    @about.logo = params[:logo]
    if @about.save
      flash[:notice] = "Your changes were saved."
      redirect_to :action => "show"
    else
      flash[:error] = "Sorry. Your changes could not be saved. Please Try Again"
      render :show
    end
  end

  private
  def set_about
    @about = About.first
  end

end