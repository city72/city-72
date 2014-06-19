# encoding: utf-8

class EmergencyStoryImageUploader < BaseImageUploader
  process :resize_and_fill => [468, 270]

  version :common do
    process :resize_and_fill => [468, 270]
  end

end
