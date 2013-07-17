class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :main_image_url
      t.string :victim
      t.string :disaster
      t.string :location
      t.string :date
      t.integer :age
      t.string :civil_state
      t.string :home_type
      t.text :main_story
      t.text :main_quote

      t.string :needed_list_1_image_url
      t.string :needed_list_1_quote
      t.string :needed_list_2_image_url
      t.string :needed_list_2_quote
      t.string :needed_list_3_image_url
      t.string :needed_list_3_quote

      t.string :learned_list_1_quote
      t.string :learned_list_1_href
      t.string :learned_list_1_anchor
      t.string :learned_list_2_quote
      t.string :learned_list_2_href
      t.string :learned_list_2_anchor
      t.string :learned_list_3_quote
      t.string :learned_list_3_href
      t.string :learned_list_3_anchor

      t.timestamps
    end
  end
end
