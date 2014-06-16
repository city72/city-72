class CityConnectionSerializer < ActiveModel::Serializer
  attributes :id, :facebook_page_url

  has_many :twitter_accounts
  has_many :city_networks
  has_many :city_resources
end
