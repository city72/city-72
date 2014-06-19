class AddLogoToCityNetwork < ActiveRecord::Migration
  def change
    add_column :city_networks, :logo, :string
  end
end
