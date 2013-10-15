class Kit < ActiveRecord::Base
  attr_accessible :image, :title, :use_case, :remote_image_url

  mount_uploader :image, KitUploader

  validates :title, :image, presence: true

end
