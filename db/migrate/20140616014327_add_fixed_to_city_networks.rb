class AddFixedToCityNetworks < ActiveRecord::Migration
  def change
    add_column :city_networks, :fixed, :boolean
  end
end
