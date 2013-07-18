ActiveAdmin.register Item do
  config.paginate = false

  scope :all
  [:Essential, :Useful, :Personal].each do |tag|
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
        image_tag(item.image, size: "100x100")
      end
    end
    column :category
    default_actions
  end


end
