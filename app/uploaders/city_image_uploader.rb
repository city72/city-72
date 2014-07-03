# encoding: utf-8

class CityImageUploader < BaseImageUploader
  process :resize_to_fill => [1020, 538]

  version :common do
    process :resize_to_fill => [1020, 538]
  end

end
