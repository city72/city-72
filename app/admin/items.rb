ActiveAdmin.register Item do
  config.paginate = false

  scope :all
  Categories::all.each do |tag|
    scope tag do |items|
      items.where("category = '#{tag}'")
    end
  end

  # hide the links entirely
  index :download_links => false do
    selectable_column
    column :title
    column :image do |item|
      if item.image.to_s != ""
        image_tag(item.image_url, size: "100x100")
      end
    end
    column :category
    default_actions
  end

  form do |f|
    f.inputs "Member Details" do
      f.input :title
      f.input :image
      f.input :use_case
      f.input :category, as: :select, collection: Categories::all
      f.actions
    end
  end

end
