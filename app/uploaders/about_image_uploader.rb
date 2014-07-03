# encoding: utf-8

class AboutImageUploader < BaseImageUploader

  process :resize_to_fill => [750, 417]

  version :common do
    process :resize_to_fill => [750, 417]
  end

end