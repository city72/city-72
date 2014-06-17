class CreateEmergencyStories < ActiveRecord::Migration
  def change
    create_table :emergency_stories do |t|
      t.string :name
      t.string :location
      t.text :story
      t.integer :call_to_action_cd

      t.timestamps
    end
  end
end
