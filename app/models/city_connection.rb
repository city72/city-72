class CityConnection < ActiveRecord::Base
  attr_accessible :facebook_page_url, :twitter_accounts_attributes, :city_networks_attributes

  has_many :twitter_accounts
  accepts_nested_attributes_for :twitter_accounts, allow_destroy: true

  has_many :city_networks
  accepts_nested_attributes_for :city_networks, allow_destroy: true

end
