class ApplicationController < ActionController::Base
  protect_from_forgery
  include SimpleCaptcha::ControllerHelpers

  before_filter :set_configured_vars

  def static_content
  	#expires_in 1.days, public: true
    expires_in 20.seconds, public: true
  end

  def dynamic_content
  	#expires_in 1.minutes, public: true
    expires_in 20.seconds, public: true
  end

  def self.empty_methods *methods
  	methods.each do |method|
  		define_method method do
  		end
  	end
  end

  protected
  def set_configured_vars
    @mode = Mode.first
    @city = City.first
    @about = About.first
    @analytic = Analytic.first
  end

  private
    def after_sign_out_path_for(resource_or_scope)
      cms_root_path
    end
end
