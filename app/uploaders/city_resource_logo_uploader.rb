# encoding: utf-8

class CityResourceLogoUploader < BaseImageUploader
  process :resize_to_fit => [300, 75]

  version :common do
    process :resize_to_fit => [300, 75]
  end

end
