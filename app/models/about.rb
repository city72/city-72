class About < ActiveRecord::Base
  attr_accessible :brought_to_you_by, :image, :logo

  mount_uploader :image, AboutImageUploader
  mount_uploader :logo, AboutLogoUploader
  validates :brought_to_you_by, presence: true
end
