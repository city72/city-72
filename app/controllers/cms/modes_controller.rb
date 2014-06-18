class Cms::ModesController < BackOfficeController

  def turn_off
    mode = Mode.first
    mode.em_mode = false
    mode.save!
    redirect_to(:back)
  end

  def turn_on
    mode = Mode.first
    mode.em_mode = true
    mode.attributes = params[:mode]
    mode.save!
    redirect_to(:back)
  end

end