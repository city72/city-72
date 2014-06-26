class AddImageCreditsFieldsToAbouts < ActiveRecord::Migration
  def change
    add_column :abouts, :photographer_1, :string
    add_column :abouts, :photographer_1_url, :string
    add_column :abouts, :photographer_2, :string
    add_column :abouts, :photographer_2_url, :string
    add_column :abouts, :photographer_3, :string
    add_column :abouts, :photographer_3_url, :string
    add_column :abouts, :photographer_4, :string
    add_column :abouts, :photographer_4_url, :string
    add_column :abouts, :photographer_5, :string
    add_column :abouts, :photographer_5_url, :string
  end
end
