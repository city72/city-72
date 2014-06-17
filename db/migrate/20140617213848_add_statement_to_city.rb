class AddStatementToCity < ActiveRecord::Migration
  def change
    add_column :cities, :statement, :text
  end
end
