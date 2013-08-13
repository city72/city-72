class ChangesOnStoryItemsDisplay < ActiveRecord::Migration
  def change
  	add_column :stories, :item1_subtitle, :string
  	add_column :stories, :item2_subtitle, :string
  	add_column :stories, :item3_subtitle, :string

  	add_column :stories, :item1_link, :string
  	add_column :stories, :item2_link, :string
  	add_column :stories, :item3_link, :string

  	add_column :stories, :items_images_display_type, :string

  	add_column :stories, :items_title, :string

  	remove_column :stories, :lesson1_quote
  	remove_column :stories, :lesson2_quote
  	remove_column :stories, :lesson3_quote
  end
end
