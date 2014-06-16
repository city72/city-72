class AddIncludedToCityResources < ActiveRecord::Migration
  def change
    add_column :city_resources, :included, :boolean
  end
end
