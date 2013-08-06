require 'mandrill'

class Email < ActiveRecord::Base
  attr_accessible :from_email, :from_name, :html_message, :preserve_recipients, :subject

  before_create :send_email

  def send_email
		suscriptions = Suscription.all
		mandrill = Mandrill::API.new 'D7R-wjVdpCoJoIEnVkgnAQ'
		message = {
			from_email: self.from_email,
			from_name: self.from_name,
			to: Suscription.all.map { |s| { email: s[:email] } },
			subject: self.subject,
			preserve_recipients: self.preserve_recipients,
		}
		mandrill.messages.send(message) # Mandrill errors are thrown as exceptions
	end
end
