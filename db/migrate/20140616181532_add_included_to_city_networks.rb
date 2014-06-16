class AddIncludedToCityNetworks < ActiveRecord::Migration
  def change
    add_column :city_networks, :included, :boolean
  end
end
