class AddIndexToKits < ActiveRecord::Migration
  def change
    add_column :kits, :index, :integer
  end
end
