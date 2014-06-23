class KitSerializer < ActiveModel::Serializer
  attributes :id, :use_case, :title, :image_url
end
