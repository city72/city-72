class EmailsController < ApplicationController
	def send_email
		if simple_captcha_valid? || !MailHelper::posible_attack?
			message = {
				from_email: params[:from_email],
				from_name: params[:name],
				to: [{ email: 'tomas@zauberlabs.com' }],
				subject: "SF-72 contact form",
				text: params[:message]
			}
			responseMsj = ""
			if(!params[:from_email].blank?)
				begin
					MailHelper::sendMail(message)
				rescue Mandrill::Error => e
					puts "A mandrill error occurred: #{e.class} - #{e.message}"
					responseMsj = "The email could not be sent"
				end
			else
				responseMsj = "Please enter an email address"
			end
		else
			responseMsj = "wrong captcha solving"
		end
		if responseMsj.blank?
			render json: { msj: "The email was sent" }
		else
			render json: { msj: responseMsj, status: 500 }, status: 500
		end
	end
end
