class AddNetworkUrlToCityNetworks < ActiveRecord::Migration
  def change
    add_column :city_networks, :network_url, :string
  end
end
