class Cms::AnalyticsController < BackOfficeController

  before_filter :set_about

  empty_methods :show

  def update
    @analytic.attributes = params[:analytic]
    if @analytic.save
      flash[:notice] = "Your changes were saved."
      redirect_to :action => "show"
    else
      flash[:error] = "Sorry. Your changes could not be saved. Please Try Again"
      render :show
    end
  end

  private
  def set_about
    @analytic = Analytic.first
  end

end