class EmergencyModeController < ApplicationController
	def index
		render json: Mode.first
	end
end