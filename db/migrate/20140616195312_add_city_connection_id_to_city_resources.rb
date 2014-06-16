class AddCityConnectionIdToCityResources < ActiveRecord::Migration
  def change
    add_column :city_resources, :city_connection_id, :integer
  end
end
