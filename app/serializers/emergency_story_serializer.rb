class EmergencyStorySerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :story, :selected, :call_to_action_cd, :image_url, :video
end
