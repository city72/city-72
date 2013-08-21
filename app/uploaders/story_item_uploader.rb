# encoding: utf-8

class StoryItemUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  include CarrierWave::RMagick

  process :convert => 'png'
  process :resize_to_fill => [300, 190]

  version :retina do
  	process :resize_to_fill => [600, 380]
  end

  version :full_bleed do
    process :resize_to_fill => [465, 190]
  end

end
