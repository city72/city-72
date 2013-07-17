class KitSerializer < ActiveModel::Serializer
  attributes :id, :image, :url, :title, :use_case
end
