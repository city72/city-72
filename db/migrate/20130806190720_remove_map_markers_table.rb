class RemoveMapMarkersTable < ActiveRecord::Migration
  def change
  	drop_table :map_markers
  end
end
