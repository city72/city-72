class AddBroughtByToCities < ActiveRecord::Migration
  def change
    add_column :cities, :brought_by, :string
  end
end
