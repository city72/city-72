class CityResource < ActiveRecord::Base
  attr_accessible :description, :name, :website, :included, :logo

  mount_uploader :logo, CityResourceLogoUploader

  scope :included, -> { where(included: true).order(:id) }
end
