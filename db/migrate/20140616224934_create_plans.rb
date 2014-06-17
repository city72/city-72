class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.integer :city_id

      t.timestamps
    end
  end
end
