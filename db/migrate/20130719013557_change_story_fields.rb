class ChangeStoryFields < ActiveRecord::Migration
  def change
    rename_column :stories, :main_image_url,  :main_image

    remove_column :stories, :location
    remove_column :stories, :date
    add_column :stories, :place_and_date, :string

    remove_column :stories, :age
    remove_column :stories, :civil_state
    remove_column :stories, :home_type
    add_column :stories, :story_header, :string

    rename_column :stories, :main_story, :story
    rename_column :stories, :main_quote, :quote

    rename_column :stories, :needed_list_1_image_url,  :item1_image
    rename_column :stories, :needed_list_1_quote,  :item1_quote
    rename_column :stories, :needed_list_2_image_url,  :item2_image
    rename_column :stories, :needed_list_2_quote,  :item2_quote
    rename_column :stories, :needed_list_3_image_url,  :item3_image
    rename_column :stories, :needed_list_3_quote,  :item3_quote

    rename_column :stories, :learned_list_1_quote, :lesson1_quote
    rename_column :stories, :learned_list_2_quote, :lesson2_quote
    rename_column :stories, :learned_list_3_quote, :lesson3_quote

    remove_column :stories, :learned_list_1_href
    remove_column :stories, :learned_list_1_anchor
    remove_column :stories, :learned_list_2_href
    remove_column :stories, :learned_list_2_anchor
    remove_column :stories, :learned_list_3_href
    remove_column :stories, :learned_list_3_anchor
  end

end
