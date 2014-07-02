class CityConnection < ActiveRecord::Base
  attr_accessible :facebook_page_url, :twitter_accounts_attributes, :city_networks_attributes, :city_resources_attributes

  has_many :twitter_accounts
  accepts_nested_attributes_for :twitter_accounts, allow_destroy: true

  has_many :city_networks
  accepts_nested_attributes_for :city_networks, allow_destroy: true

  has_many :city_resources
  accepts_nested_attributes_for :city_resources, allow_destroy: true

  validate :selected_city_networks

  def selected_city_networks
    included_count = 0
    city_networks.each do |cn|
      included_count = included_count + 1 if cn.included
    end

    if included_count > 4
      errors.add(:city_networks_count, "There's more than 4 selected city networks.")
    end
  end
end
