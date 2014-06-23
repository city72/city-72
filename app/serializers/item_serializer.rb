class ItemSerializer < ActiveModel::Serializer
  attributes :id, :image_url, :title, :use_case, :category
end
