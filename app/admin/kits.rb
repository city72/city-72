ActiveAdmin.register Kit do
  config.paginate = false

  index do
    selectable_column
    column :image do |kit|
      if kit.image.to_s != ""
        image_tag(kit.image_url, size: "100x100")
      end
    end
    column :title
    default_actions
  end

  form do |f|
    f.inputs "Item Details" do
      f.input :title
      f.input :url, as: :url, label: "Kit URL"
      f.input :image, :as => :file, :hint => f.template.image_tag(f.object.image.url, size: "100x100")
      f.input :use_case
    end
    f.actions
  end
end
