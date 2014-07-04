# encoding: utf-8

class KitUploader < BaseImageUploader
  process :resize_to_fill => [300, 190]

  version :common do
  	process :resize_to_fill => [300, 190]
  end

  version :retina do
  	process :resize_to_fill => [600, 380]
  end

end
