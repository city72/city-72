class CityResourceSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :website, :included, :logo_url, :index

  def logo_url
    object.logo.url if object.logo
  end

end
