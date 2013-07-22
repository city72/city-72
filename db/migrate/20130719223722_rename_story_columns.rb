class RenameStoryColumns < ActiveRecord::Migration
  def change
  	rename_column :stories, :main_image, :video_url

  	remove_column :stories, :place_and_date

  	add_column :stories, :date, :string
  	add_column :stories, :location, :string

  	add_column :stories, :video_image, :string
  end
end
