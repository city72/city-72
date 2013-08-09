require 'mandrill'

module MailHelper

	def self.posible_attack?
		mandrill = Mandrill::API.new 'D7R-wjVdpCoJoIEnVkgnAQ'
		date_from = Time.now.strftime("%Y-%m-%d")
	    result = mandrill.messages.search_time_series "*", date_from
	    return result.size < 1 ? false : result[0]['sent'] > 10
	end

	def self.sendMail(message)
		mandrill = Mandrill::API.new 'D7R-wjVdpCoJoIEnVkgnAQ'
		mandrill.messages.send(message) # Mandrill errors are thrown as exceptions
	end

end