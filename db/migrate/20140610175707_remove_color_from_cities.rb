class RemoveColorFromCities < ActiveRecord::Migration
  def up
    remove_column :cities, :color
  end

  def down
    add_column :cities, :color, :integer
  end
end
