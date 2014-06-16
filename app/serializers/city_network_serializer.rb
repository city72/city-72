class CityNetworkSerializer < ActiveModel::Serializer
  attributes :id, :headline, :now, :in_an_emergency, :fixed
end
