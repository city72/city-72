class AddRecommendationsToModes < ActiveRecord::Migration
  def change
    add_column :modes, :recommendation_1_title, :string
    add_column :modes, :recommendation_1_text, :text
    add_column :modes, :recommendation_2_title, :string
    add_column :modes, :recommendation_2_text, :text
    add_column :modes, :recommendation_3_title, :string
    add_column :modes, :recommendation_3_text, :text
  end
end
