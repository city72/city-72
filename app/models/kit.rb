class Kit < ActiveRecord::Base
  attr_accessible :title, :use_case, :image, :image_url, :index

  mount_uploader :image, KitUploader

  validates :title, :image, presence: true

end
