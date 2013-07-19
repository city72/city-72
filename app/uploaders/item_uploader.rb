# encoding: utf-8

class ItemUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  include CarrierWave::RMagick

  process :convert => 'png'
  process :resize_to_fit => [290, 220]

  # def extension_white_list
  #   %w(png)
  # end
end
