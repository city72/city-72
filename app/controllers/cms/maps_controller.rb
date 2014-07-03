class Cms::MapsController < BackOfficeController

  before_filter :set_emergency_data

  empty_methods :show

  def update
    @emergency_data.attributes = params[:emergency_data]
    if @emergency_data.save
      flash[:notice] = "Your changes were saved."
      redirect_to :action => "show"
    else
      flash[:error] = "Sorry. Your changes could not be saved. Please try again"
      render :show
    end
  end

  private
  def set_emergency_data
    @emergency_data = EmergencyData.first
  end

end