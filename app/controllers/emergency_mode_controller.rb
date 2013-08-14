class EmergencyModeController < StaticContentController
	def index
		render json: Mode.first
	end
end