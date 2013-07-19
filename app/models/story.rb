class Story < ActiveRecord::Base
	attr_accessible :main_image,
    :person, :event,
    :place_and_date,
    :story_header, :story, :quote,
		:item1_image, :item1_quote,
    :item2_image, :item2_quote,
    :item3_image, :item3_quote,
		:lesson1_quote,
    :lesson2_quote,
		:lesson3_quote,

		:remote_main_image_url,
		:remote_needed_list_1_image_url,
		:remote_needed_list_2_image_url,
		:remote_needed_list_3_image_url

	mount_uploader :main_image, StoryMainUploader
	mount_uploader :item1_image, StoryItemUploader
	mount_uploader :item2_image, StoryItemUploader
	mount_uploader :item3_image, StoryItemUploader
end
