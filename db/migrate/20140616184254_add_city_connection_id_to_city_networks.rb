class AddCityConnectionIdToCityNetworks < ActiveRecord::Migration
  def change
    add_column :city_networks, :city_connection_id, :integer
  end
end
