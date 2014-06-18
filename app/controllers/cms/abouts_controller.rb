class Cms::AboutsController < BackOfficeController

  before_filter :set_about

  empty_methods :show

  def update
    @about.attributes = params[:about]
    @about.save
    render :show
  end

  private
  def set_about
    @about = About.first
  end

end