ActiveAdmin.register Story do
  menu false
	config.paginate = false

	index do
		selectable_column
		column :video_image do |story|
			if story.video_image.to_s != ""
				image_tag(story.video_image.url)
			end
		end
		column :person
		column :event
    column :category
		default_actions
	end

  form do |f|
    f.inputs "Event Details" do
      f.input :person, label: "Person Name"
      f.input :person_type, label: "Person Type", as: :select, collection: PersonTypes::all
      f.input :event
      f.input :category, as: :select, collection: StoryCategories::all
      f.input :location
      f.input :date
      f.input :video_url
      f.input :video_image, hint: f.template.image_tag(f.object.video_image.url, size: "100x100")
    end

    f.inputs "Story Details" do
      f.input :story_header
      f.input :story
      f.input :quote
    end

    f.inputs "Needed Items" do

      f.input :items_images_display_type, label: 'Images Display Type', as: :select, collection: StoryItemsDisplayTypes::all
      f.input :items_title, label: 'Title', as: :select, collection: StoryItemsTitles::all

      f.inputs "First Item" do
        f.input :item1_image, label: 'Image', hint: f.template.image_tag(f.object.item1_image.url, size: "100x100")
        f.input :item1_subtitle, label: 'Subtitle'
        f.input :item1_quote, label: 'Quote'
        f.input :item1_link, label: 'Link'

      end
      f.inputs "Second Item" do
        f.input :item2_image, label: 'Image', hint: f.template.image_tag(f.object.item2_image.url, size: "100x100")
        f.input :item2_subtitle, label: 'Subtitle'
        f.input :item2_quote, label: 'Quote'
        f.input :item2_link, label: 'Link'
      end
      f.inputs "Third Item" do
        f.input :item3_image, label: 'Image', hint: f.template.image_tag(f.object.item3_image.url, size: "100x100")
        f.input :item3_subtitle, label: 'Subtitle'
        f.input :item3_quote, label: 'Quote'
        f.input :item3_link, label: 'Link'
      end

    end
    f.actions
  end

end
