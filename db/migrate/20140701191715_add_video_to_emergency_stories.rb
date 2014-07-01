class AddVideoToEmergencyStories < ActiveRecord::Migration
  def change
    add_column :emergency_stories, :video, :text
  end
end
