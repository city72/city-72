ActiveAdmin.register Kit do
  config.paginate = false

  index do
    selectable_column
    column :title
    column :image do |kit|
      image_tag(kit.image, size: "100x100")
    end
    default_actions
  end
end
