class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.string :facebook_page_url

      t.timestamps
    end
  end
end
