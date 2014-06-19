# encoding: utf-8

class ResidentImageUploader < BaseImageUploader
  process :resize_and_fill => [1420, 416]

  version :common do
    process :resize_and_fill => [710, 416]
  end

  version :retina do
    process :resize_and_fill => [1420, 416]
  end

end
