ActiveAdmin.register Story do
  menu parent: 'CMS', label: 'Manage Stories'
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
      f.input :video_url, hint: 'The URL should follow this format <strong>http://vimeo.com/NNNNNNNN</strong>'.html_safe
      f.input :video_image, hint: (f.template.image_tag(f.object.video_image.url) unless f.object.video_image.blank?)
    end

    f.inputs "Story Details" do
      f.input :story
      f.input :quote
    end

    f.inputs "Needed Items" do

      f.input :items_images_display_type, label: 'Images Display Type', as: :select, collection: StoryItemsDisplayTypes::all, include_blank: false
      f.input :items_title, label: 'Title', as: :select, collection: StoryItemsTitles::all, include_blank: false

      item_configuration = Proc.new do |index|
        f.input "item#{index}_image".to_sym, 
                label: 'Image', 
                hint: (f.template.image_tag(f.object.send("item#{index}_image".to_sym).url) unless f.object.send("item#{index}_image".to_sym).blank?)
        f.input "item#{index}_subtitle".to_sym, label: 'Subtitle'
        f.input "item#{index}_quote".to_sym, label: 'Quote'
        f.input "item#{index}_link".to_sym, label: 'Link Title'
      end

      f.inputs("First Item") { item_configuration.call(1) }
      f.inputs("Second Item") { item_configuration.call(2) }
      f.inputs("Third Item") { item_configuration.call(3) }

    end
    f.actions
  end

end
