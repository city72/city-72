class ApplicationController < ActionController::Base
  protect_from_forgery
  include SimpleCaptcha::ControllerHelpers

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

end
