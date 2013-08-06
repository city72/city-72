class CreateSuscriptions < ActiveRecord::Migration
  def change
    create_table :suscriptions do |t|
      t.string :email

      t.timestamps
    end
  end
end
