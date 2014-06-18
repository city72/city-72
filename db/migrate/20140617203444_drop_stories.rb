class DropStories < ActiveRecord::Migration
  def up
    drop_table :stories
  end

  def down
    create_table "stories", :force => true do |t|
      t.string   "video_url"
      t.string   "person"
      t.string   "event"
      t.text     "story"
      t.text     "quote"
      t.string   "item1_image"
      t.string   "item1_quote"
      t.string   "item2_image"
      t.string   "item2_quote"
      t.string   "item3_image"
      t.string   "item3_quote"
      t.datetime "created_at",                :null => false
      t.datetime "updated_at",                :null => false
      t.string   "story_header"
      t.string   "date"
      t.string   "location"
      t.string   "video_image"
      t.string   "category"
      t.string   "item1_subtitle"
      t.string   "item2_subtitle"
      t.string   "item3_subtitle"
      t.string   "items_images_display_type"
      t.string   "items_title"
      t.string   "person_type"
      t.string   "item1_link"
      t.string   "item2_link"
      t.string   "item3_link"
    end
  end
end
