class AddColorCdToCities < ActiveRecord::Migration
  def change
    add_column :cities, :color_cd, :integer
  end
end
