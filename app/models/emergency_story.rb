class EmergencyStory < ActiveRecord::Base
  attr_accessible :call_to_action_cd, :location, :name, :story, :selected, :image, :video, :index

  mount_uploader :image, EmergencyStoryImageUploader
  as_enum :call_to_action, [:get_connected, :gather_supplies, :make_a_plan]

  validates :name, :story, :location, :call_to_action_cd, presence: true
end
