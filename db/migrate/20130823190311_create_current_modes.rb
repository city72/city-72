class CreateCurrentModes < ActiveRecord::Migration
  def change
    create_table :current_modes do |t|
      t.boolean :mode

      t.timestamps
    end
  end
end
