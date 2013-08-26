ActiveAdmin.register Item do
  menu parent: 'CMS', label: 'Manage Items'
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
    column :image do |item|
      if item.image.to_s != ""
        image_tag(item.image_url)
      end
    end
    column :title
    column :category
    column :order
    default_actions
  end

  form do |f|
    f.inputs "Item Details" do
      f.input :title
      f.input :category, as: :radio, collection: Categories::all
      f.input :order
      f.input :image, :as => :file, :hint => f.template.image_tag(f.object.image.url)
      f.input :use_case, label: "Rollover"
    end
    f.actions
  end

end
