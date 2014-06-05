class CreateAffiliates < ActiveRecord::Migration
  def change
    create_table :affiliates do |t|
      t.belongs_to :city

      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
