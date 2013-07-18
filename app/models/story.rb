class Story < ActiveRecord::Base
	attr_accessible  :main_image_url, :victim, :disaster, :location, :date, :age, :civil_state, :home_type, :main_story, :main_quote,
		:needed_list_1_image_url, :needed_list_1_quote, :needed_list_2_image_url, :needed_list_2_quote, :needed_list_3_image_url, :needed_list_3_quote,
		:learned_list_1_quote, :learned_list_1_href, :learned_list_1_anchor, :learned_list_2_quote, :learned_list_2_href, :learned_list_2_anchor, 
		:learned_list_3_quote, :learned_list_3_href, :learned_list_3_anchor,
		:remote_main_image_url_url,
		:remote_needed_list_1_image_url_url,
		:remote_needed_list_2_image_url_url,
		:remote_needed_list_3_image_url_url

	mount_uploader :main_image_url, ImageUploader
	mount_uploader :needed_list_1_image_url, ImageUploader
	mount_uploader :needed_list_2_image_url, ImageUploader
	mount_uploader :needed_list_3_image_url, ImageUploader
end
