class CityResource < ActiveRecord::Base
  attr_accessible :description, :name, :website, :included, :logo, :index

  mount_uploader :logo, CityResourceLogoUploader

  scope :included, -> { where(included: true).order(:id) }
end
