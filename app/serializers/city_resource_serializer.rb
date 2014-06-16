class CityResourceSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :website, :included
end
