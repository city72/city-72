class RemoveUrlFromKits < ActiveRecord::Migration
  def up
    remove_column :kits, :url
  end

  def down
    add_column :kits, :url, :string
  end
end
