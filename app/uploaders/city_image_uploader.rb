# encoding: utf-8

class CityImageUploader < BaseImageUploader
  process :resize_and_fill => [1020, 538]

  version :common do
    process :resize_and_fill => [1020, 538]
  end

end
