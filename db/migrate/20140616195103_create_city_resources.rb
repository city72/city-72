class CreateCityResources < ActiveRecord::Migration
  def change
    create_table :city_resources do |t|
      t.string :name
      t.string :description
      t.string :website

      t.timestamps
    end
  end
end
