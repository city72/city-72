class AddIndexToModelsWithPhotos < ActiveRecord::Migration
  def change
    add_column :city_resources, :index, :integer
    add_column :city_networks, :index, :integer
    add_column :items, :index, :integer
    add_column :emergency_stories, :index, :integer
  end
end
