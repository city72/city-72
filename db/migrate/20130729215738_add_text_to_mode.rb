class AddTextToMode < ActiveRecord::Migration
  def change
  	add_column :modes, :title, :string
  	add_column :modes, :text, :string
  end
end
