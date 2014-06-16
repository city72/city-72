class CreateCityNetworks < ActiveRecord::Migration
  def change
    create_table :city_networks do |t|
      t.string :headline
      t.string :now
      t.string :in_an_emergency

      t.timestamps
    end
  end
end
