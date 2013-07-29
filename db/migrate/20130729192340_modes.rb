class Modes < ActiveRecord::Migration
  def change
  	create_table :modes do |t|
      t.boolean :em_mode

      t.timestamps
    end
  end
end
