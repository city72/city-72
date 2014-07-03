# encoding: utf-8

class PlanCommunityImageUploader < BaseImageUploader

  process :resize_to_fill => [750, 417]

  version :common do
    process :resize_to_fill => [750, 417]
  end

end