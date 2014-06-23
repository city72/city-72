class AddImageToEmergencyStories < ActiveRecord::Migration
  def change
    add_column :emergency_stories, :image, :string
  end
end
