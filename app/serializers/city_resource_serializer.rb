class CityResourceSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :website, :included, :logo_url

  def logo_url
    object.logo.url if object.logo
  end
  
end
