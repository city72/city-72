# encoding: utf-8

class AboutLogoUploader < BaseImageUploader

  process :resize_to_fit => [300, 200]

  version :common do
    process :resize_to_fit => [300, 200]
  end

end