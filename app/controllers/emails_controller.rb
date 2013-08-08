require 'mandrill'

class EmailsController < ApplicationController
	def send_email
		mandrill = Mandrill::API.new 'D7R-wjVdpCoJoIEnVkgnAQ'
		message = {
			from_email: params[:from_email],
			to: [{ email: 'tomas@zauberlabs.com' }],
			subject: params[:subject],
			text: params[:message]
		}
		responseMsj = "The email was sent"
		if(!params[:from_email].blank?)
			begin
				mandrill.messages.send(message) # Mandrill errors are thrown as exceptions
			rescue Mandrill::Error => e
				puts "A mandrill error occurred: #{e.class} - #{e.message}"
				responseMsj = "The email could not be sent"
			end
		else
			responseMsj = "Please enter an email address"
		end
		render json: { msj: responseMsj }
	end
end