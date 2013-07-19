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

  form do |f|
    f.inputs "Person Details" do
        f.input :person, label: "Name"
        f.input :age
        f.input :civil_state
        f.input :main_image_url, label: "Main Image", hint: f.template.image_tag(f.object.main_image_url.url, size: "100x100")
        f.input :home_type
    end

    f.inputs "Event Details" do
        f.input :event
        f.input :location
        f.input :date
    end

    f.inputs "Story Details" do
        f.input :main_story, label: "Story"
        f.input :main_quote, label: "Quote"
    end

    f.inputs "Needed Items" do
      f.inputs "First Item" do
        f.input :needed_list_1_quote, label: 'Quote'
        f.input :needed_list_1_image_url, label: 'Image', hint: f.template.image_tag(f.object.needed_list_1_image_url.url, size: "100x100")

      end
      f.inputs "Second Item" do
        f.input :needed_list_2_quote, label: 'Quote'
        f.input :needed_list_2_image_url, label: 'Image', hint: f.template.image_tag(f.object.needed_list_2_image_url.url, size: "100x100")
      end
      f.inputs "Third Item" do
        f.input :needed_list_3_quote, label: 'Quote'
        f.input :needed_list_3_image_url, label: 'Image', hint: f.template.image_tag(f.object.needed_list_3_image_url.url, size: "100x100")
      end

    end
    f.inputs "Lessons Learned" do
        f.input :learned_list_1_quote
        f.input :learned_list_1_href
        f.input :learned_list_1_anchor
        f.input :learned_list_2_quote
        f.input :learned_list_2_href
        f.input :learned_list_2_anchor
        f.input :learned_list_3_quote
        f.input :learned_list_3_href
        f.input :learned_list_3_anchor
    end
    f.actions
  end

end
