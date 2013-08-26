ActiveAdmin.register Kit, as: 'Item To Share' do
  menu parent: 'CMS', label: 'Manage Items to Share'
  
  config.paginate = false

  index do
    selectable_column
    column :image do |kit|
      if kit.image.to_s != ""
        image_tag(kit.image_url)
      end
    end
    column :title
    default_actions
  end

  form do |f|
    f.inputs "Items to Share Details" do
      f.input :title
      f.input :url, as: :url, label: "Item URL"
      f.input :image, :as => :file, :hint => f.template.image_tag(f.object.image.url)
      f.input :use_case, label: "Rollover"
    end
    f.actions
  end
end
