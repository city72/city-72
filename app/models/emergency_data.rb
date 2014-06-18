class EmergencyData < ActiveRecord::Base
  attr_accessible :citizen_timeline_id, :map_url, :partner_timeline_id, :transportation_timeline_id, :your_hashtag_timeline_id

  validates :citizen_timeline_id, :map_url, :partner_timeline_id, 
    :transportation_timeline_id, :your_hashtag_timeline_id, presence: true
end
