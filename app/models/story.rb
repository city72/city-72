class Story < ActiveRecord::Base
	attr_accessible :video_url, :video_image,
    :person, :event,
    :location, :date,
    :story_header, :story, :quote,
		:item1_image, :item1_quote,
    :item2_image, :item2_quote,
    :item3_image, :item3_quote,
		:lesson1_quote,
    :lesson2_quote,
		:lesson3_quote,
		:category,

		:remote_item1_image_url,
		:remote_item2_image_url,
		:remote_item3_image_url,
		:remote_video_image_url

	mount_uploader :video_image, StoryMainUploader
	mount_uploader :item1_image, StoryItemUploader
	mount_uploader :item2_image, StoryItemUploader
	mount_uploader :item3_image, StoryItemUploader

	validates :category, inclusion: { in: StoryCategories::all_to_s, message: "%{value} is not a valid category" }
end