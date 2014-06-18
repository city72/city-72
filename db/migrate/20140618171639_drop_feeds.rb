class DropFeeds < ActiveRecord::Migration
  def up
    drop_table :feeds
  end

  def down
    create_table "feeds", :force => true do |t|
      t.string   "widget_id"
      t.string   "type"
      t.datetime "created_at", :null => false
      t.datetime "updated_at", :null => false
    end
  end
end
