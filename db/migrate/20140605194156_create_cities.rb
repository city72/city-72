class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name, :null => false
      t.string :abbreviation
      t.string :moniker
      t.integer :color
      t.string :image
      t.string :image_credit
      t.string :resident_image
      t.string :resident_image_credit
      t.string :contact_email
      t.string :agency_site

      t.timestamps
    end
  end
end
