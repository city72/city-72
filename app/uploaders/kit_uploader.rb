# encoding: utf-8

class KitUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  include CarrierWave::RMagick

  process :convert => 'png'
  process :resize_to_fit => [260, 160]

  # def extension_white_list
  #   %w(png)
  # end
end
