# encoding: utf-8

class StoryMainUploader < BaseImageUploader

  process :resize_and_fill => [750, 417]

  version :common do
	process :resize_and_fill => [750, 417]
  end

  version :retina do
  	process :resize_and_fill => [1500, 834]
  end

end
