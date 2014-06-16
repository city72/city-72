class CityResource < ActiveRecord::Base
  attr_accessible :description, :name, :website, :included
end
