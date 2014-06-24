class Plan < ActiveRecord::Base
  attr_accessible :city_id, :quick_guide_id, :community_image

  mount_uploader :community_image, PlanCommunityImageUploader
  belongs_to :quick_guide
end
