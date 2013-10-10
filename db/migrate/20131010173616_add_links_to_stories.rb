class AddLinksToStories < ActiveRecord::Migration
  def change
    add_column :stories, :item1_link, :string
    add_column :stories, :item2_link, :string
    add_column :stories, :item3_link, :string
  end
end
