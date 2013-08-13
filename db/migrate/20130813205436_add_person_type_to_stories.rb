class AddPersonTypeToStories < ActiveRecord::Migration
  def change
  	add_column :stories, :person_type, :string
  end
end
