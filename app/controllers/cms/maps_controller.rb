class Cms::MapsController < BackOfficeController

  before_filter :set_emergency_data

  empty_methods :show

  def update
    @emergency_data.attributes = params[:emergency_data]
    if @emergency_data.save
      flash[:notice] = "All data were successfully updated."
      redirect_to :action => "show"
    else
      flash[:error] = "There was an error uploading the changes, please try again."
      render :show
    end
  end

  private
  def set_emergency_data
    @emergency_data = EmergencyData.first
  end

end