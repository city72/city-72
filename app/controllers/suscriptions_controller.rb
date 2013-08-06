require 'mandrill'

class SuscriptionsController < ApplicationController

	def create
		Suscription.create!(email: params[:email])
		render json: { message: "suscription created for #{params[:email]}" }
	end

	def send_mail
		suscriptions = Suscription.all
		mandrill = Mandrill::API.new 'D7R-wjVdpCoJoIEnVkgnAQ'
		message = {
			from_email: "mariano@zauberlabs.com",
			from_name: "Example Name",
			to: Suscription.all.map { |s| { email: s[:email] } },
			subject: "test email",
			preserve_recipients: false,
		}
		render json: mandrill.messages.send(message)
	end

end
