class CityNetworkSerializer < ActiveModel::Serializer
  attributes :id, :headline, :now, :in_an_emergency, :fixed, :included, :network_url, :logo_url, :index

  def logo_url
    object.logo.url if object.logo
  end
end
