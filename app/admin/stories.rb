ActiveAdmin.register Story do
	config.paginate = false

	index do
		selectable_column
		column :main_image_url do |story|
			if story.main_image_url.to_s != ""
				image_tag(story.main_image_url_url, size: "100x100")
			end
		end
		column :person
		column :event
		column :location
		default_actions
	end
end
