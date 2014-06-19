# encoding: utf-8

class KitUploader < BaseImageUploader
  process :resize_and_fill => [600, 380]

  version :common do
  	process :resize_and_fill => [300, 190]
  end

  version :retina do
  	process :resize_and_fill => [600, 380]
  end

end
