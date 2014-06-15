class RenameConnectionToCityConnection < ActiveRecord::Migration
  def up
    rename_table :connections, :city_connections
    rename_column :twitter_accounts, :connection_id, :city_connection_id
  end

  def down
    rename_table :city_connections, :connections
    rename_column :twitter_accounts, :city_connection_id, :connection_id
  end
end
