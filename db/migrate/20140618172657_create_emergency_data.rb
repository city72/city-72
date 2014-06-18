class CreateEmergencyData < ActiveRecord::Migration
  def change
    create_table :emergency_data do |t|
      t.string :map_url
      t.string :citizen_timeline_id
      t.string :partner_timeline_id
      t.string :transportation_timeline_id

      t.timestamps
    end
  end
end
