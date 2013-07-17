class Kit < ActiveRecord::Base
  attr_accessible :image, :title, :url, :use_case

  mount_uploader :image, ImageUploader
end
