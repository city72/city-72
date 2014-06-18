class RemoveRecommendationsFromModes < ActiveRecord::Migration
  def up
    remove_column :modes, :recommendation_1_title
    remove_column :modes, :recommendation_2_title
    remove_column :modes, :recommendation_3_title
    remove_column :modes, :recommendation_1_text
    remove_column :modes, :recommendation_2_text
    remove_column :modes, :recommendation_3_text
  end

  def down
    add_column :modes, :recommendation_3_text, :string
    add_column :modes, :recommendation_2_text, :string
    add_column :modes, :recommendation_1_text, :string
    add_column :modes, :recommendation_3_title, :string
    add_column :modes, :recommendation_2_title, :string
    add_column :modes, :recommendation_1_title, :string
  end
end
