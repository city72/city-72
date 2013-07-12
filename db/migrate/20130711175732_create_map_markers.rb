class CreateMapMarkers < ActiveRecord::Migration
  def change
    create_table :map_markers do |t|
      t.point :lon_lat, geographic: true
      t.string :message

      t.timestamps
    end
  end
end
