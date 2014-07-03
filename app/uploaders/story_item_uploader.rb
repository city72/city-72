# encoding: utf-8

class StoryItemUploader < BaseImageUploader

  version :common do
    process :resize_to_fill => [468, 270]
  end

  version :retina do
    process :resize_to_fill => [936, 540]
  end

  version :common_full_bleed do
    process :resize_to_fill => [465, 190]
  end

  version :retina_full_bleed do
  	process :resize_to_fill => [930, 380]
  end

end
