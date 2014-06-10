class AddPossessiveToCities < ActiveRecord::Migration
  def change
    add_column :cities, :possessive, :string
  end
end
