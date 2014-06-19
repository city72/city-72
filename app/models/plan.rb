class Plan < ActiveRecord::Base
  attr_accessible :city_id, :emergency_type_cd, :community_image

  mount_uploader :community_image, PlanCommunityImageUploader
  as_enum :emergency_type, earthquake: 0, hurricane: 1, flood: 2
end
