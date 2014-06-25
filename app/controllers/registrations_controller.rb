class RegistrationsController < Devise::RegistrationsController

  def create
    render nothing: true, status: 503
  end

  private
  def after_update_path_for(resource)
    session[:previous_url] || cms_root_path
  end

end