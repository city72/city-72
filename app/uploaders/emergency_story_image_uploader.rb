# encoding: utf-8

class EmergencyStoryImageUploader < BaseImageUploader
  process :resize_and_pad => [1020, 538]

  version :common do
    process :resize_and_pad => [320, 169]
  end

end
