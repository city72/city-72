class CityNetwork < ActiveRecord::Base
  attr_accessible :headline, :in_an_emergency, :now, :network_url, :included, :fixed, :logo

  mount_uploader :logo, CityNetworkLogoUploader
  belongs_to :city_connection
end
