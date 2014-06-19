class AddLogoToAbout < ActiveRecord::Migration
  def change
    add_column :abouts, :logo, :string
  end
end
