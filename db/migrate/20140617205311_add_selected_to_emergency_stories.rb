class AddSelectedToEmergencyStories < ActiveRecord::Migration
  def change
    add_column :emergency_stories, :selected, :boolean
  end
end
