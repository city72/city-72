class Kit < ActiveRecord::Base
  attr_accessible :image, :title, :url, :use_case, :remote_image_url

  mount_uploader :image, KitUploader

  validates :title, :image, presence: true
  validates :url, :format => URI::regexp(%w(http https)), allow_blank: true

end
