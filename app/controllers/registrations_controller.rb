class RegistrationsController < Devise::RegistrationsController

  def create
    render nothing: true, status: 503
  end

  def edit
    @section = params[:section]
    super
  end

  def update
    @section = params[:section]
    @form_name = params[:admin_user][:form_name]
    params[:admin_user] = params[:admin_user].except(:form_name)
    super
  end

  private
  def after_update_path_for(resource)
    session[:previous_url] || cms_root_path
  end

end