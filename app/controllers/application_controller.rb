class ApplicationController < ActionController::Base
  protect_from_forgery
  include SimpleCaptcha::ControllerHelpers

  before_filter :set_current_mode

  def static_content
  	expires_in 1.days, public: true
  end

  def dynamic_content
  	expires_in 1.minutes, public: true
  end

  def self.empty_methods *methods
  	methods.each do |method|
  		define_method method do
  		end
  	end  
  end

  private
    def set_current_mode
      @mode = CurrentMode.get_current_mode
      @preview = CurrentMode.is_preview_mode
    end

end
