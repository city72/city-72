class CreateMapMarkers < ActiveRecord::Migration
  def change
    create_table :map_markers do |t|
      t.string :lon_lat
      t.string :message

      t.timestamps
    end
  end
end
