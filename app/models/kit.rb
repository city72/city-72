class Kit < ActiveRecord::Base
  attr_accessible :title, :use_case, :image, :image_url

  mount_uploader :image, KitUploader

  validates :title, :image, presence: true

end
