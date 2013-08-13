class RemoveItemsLinkInStories < ActiveRecord::Migration
  def change
  	remove_column :stories, :item1_link
  	remove_column :stories, :item2_link
  	remove_column :stories, :item3_link
  end
end
