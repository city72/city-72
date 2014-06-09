class City < ActiveRecord::Base
  attr_accessible :name, :abbreviation, :moniker, :color, :image_credit,
    :resident_image_credit, :contact_email, :agency_site

  mount_uploader :image, CityImageUploader
  mount_uploader :resident_image, ResidentImageUploader

  has_many :affiliates
  accepts_nested_attributes_for :affiliates

  validates :name, :abbreviation, :moniker, :color, presence: true

end
