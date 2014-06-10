class AddAgencyUrlToCities < ActiveRecord::Migration
  def change
    add_column :cities, :agency_url, :string
  end
end
