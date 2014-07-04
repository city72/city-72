class CityConnection < ActiveRecord::Base
  attr_accessible :facebook_page_url, :twitter_accounts_attributes, :city_networks_attributes, :city_resources_attributes

  has_many :twitter_accounts
  accepts_nested_attributes_for :twitter_accounts, allow_destroy: true

  has_many :city_networks,  :order => 'index ASC'
  accepts_nested_attributes_for :city_networks, allow_destroy: true

  has_many :city_resources,  :order => 'index ASC'
  accepts_nested_attributes_for :city_resources, allow_destroy: true

  validate :city_networks_count
  validate :city_resources_count

  def as_json(options = nil)
    json = super(options)
    json[:city_networks] = city_networks.as_json
    json[:city_resources] = city_resources.as_json
    json
  end

  private

    def city_networks_count
      validation_count(city_networks, 3, 3, :city_networks_count, "city networks")
    end

    def city_resources_count
      validation_count(city_resources, 6, 6, :city_resources_count, "city resources")
    end

    def validation_count(list, max_count, max_selected, error_name, resources)
      included_count = 0
      count = 0
      list.each do |item|
        count = count + 1
        included_count = included_count + 1 if item.included
      end

      if count > max_count
        errors.add(error_name, "You can't create more than #{max_count} #{resources}.")
      else
        if included_count > max_selected
          errors.add(error_name, "There's more than #{max_selected} selected #{resources}.")
        end
      end
    end
end
