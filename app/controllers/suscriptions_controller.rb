class SuscriptionsController < ApplicationController

	def create
		Suscription.create!(email: params[:email])
		render json: { message: "suscription created for #{params[:email]}" }
	end

end
