# encoding: utf-8

class ResidentImageUploader < BaseImageUploader
  process :resize_to_fill => [710, 416]

  version :common do
    process :resize_to_fill => [710, 416]
  end

  version :retina do
    process :resize_to_fill => [1420, 832]
  end

end
