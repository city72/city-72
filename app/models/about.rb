class About < ActiveRecord::Base
  attr_accessible :brought_to_you_by, :image, :logo, :photographer_1, :photographer_1_url, 
    :photographer_2, :photographer_2_url, :photographer_3, :photographer_3_url,
    :photographer_4, :photographer_4_url, :photographer_5, :photographer_5_url

  mount_uploader :image, AboutImageUploader
  mount_uploader :logo, AboutLogoUploader
  validates :brought_to_you_by, presence: true
end
