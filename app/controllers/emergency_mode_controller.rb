class EmergencyModeController < ApplicationController
	
	after_filter :dynamic_content

	def index
		render json: Mode.first
	end
end