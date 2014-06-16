class CityNetworkSerializer < ActiveModel::Serializer
  attributes :id, :headline, :now, :in_an_emergency, :fixed, :included, :network_url
end
