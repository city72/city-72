# encoding: utf-8

class StoryItemUploader < BaseImageUploader

  version :common do
    process :resize_and_pad => [300, 190]
  end

  version :retina do
    process :resize_and_pad => [600, 380]
  end

  version :common_full_bleed do
    process :resize_and_pad => [465, 190]
  end

  version :retina_full_bleed do
  	process :resize_and_pad => [930, 380]
  end

end
