ActiveAdmin.register Kit do
  config.paginate = false

  index do
    selectable_column
    column :title
    column :image do |kit|
	    if kit.image.to_s != ""
	      image_tag(kit.image, size: "100x100")
	  	end
    end
    default_actions
  end
end
