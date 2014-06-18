class AddYourHashtagTimelineIdToEmergencyData < ActiveRecord::Migration
  def change
    add_column :emergency_data, :your_hashtag_timeline_id, :string
  end
end
