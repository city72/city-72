class AddLogoToCityResource < ActiveRecord::Migration
  def change
    add_column :city_resources, :logo, :string
  end
end