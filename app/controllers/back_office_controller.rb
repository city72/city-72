class BackOfficeController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_admin_user!

end
