class Cms::MapsController < BackOfficeController

  before_filter :set_emergency_data

  empty_methods :show

  def update
    @emergency_data.attributes = params[:emergency_data]
    @emergency_data.save
    render :show
  end

  private
  def set_emergency_data
    @emergency_data = EmergencyData.first
  end

end