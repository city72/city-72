class Item < ActiveRecord::Base
  attr_accessible :category, :image, :title, :use_case, :remote_image_url

  mount_uploader :image, ItemUploader

  validates :category, inclusion: { in: Categories::all_to_s, message: "%{value} is not a valid category" }
end
