class City < ActiveRecord::Base
  attr_accessible :name, :abbreviation, :moniker, :resident_image_credit,
    :contact_email, :agency_site, :affiliates_attributes,
    :possessive, :brought_by, :agency_url, :color_cd, :statement

  mount_uploader :image, CityImageUploader
  mount_uploader :resident_image, ResidentImageUploader

  as_enum :color, [:gold, :green, :blue], prefix: true

  has_many :affiliates
  accepts_nested_attributes_for :affiliates, allow_destroy: true

  has_one :plan

  validates :name, :abbreviation, :possessive, :brought_by, :agency_url, :contact_email,
    :color_cd, presence: true

  validates :abbreviation, length: { :maximum => 4 }

end
