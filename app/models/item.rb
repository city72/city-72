class Item < ActiveRecord::Base
  attr_accessible :category, :image, :title, :use_case, :remote_image_url

  mount_uploader :image, ImageUploader

  validates :category, inclusion: { in: %w(Essential Useful Personal),
    message: "%{value} is not a valid category" }
end
