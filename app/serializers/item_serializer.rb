class ItemSerializer < ActiveModel::Serializer
  attributes :id, :image, :title, :use_case, :category
end
