class DropCurrentModes < ActiveRecord::Migration
  def up
    drop_table :current_modes
  end

  def down
    create_table "current_modes", :force => true do |t|
      t.boolean  "mode"
      t.datetime "created_at", :null => false
      t.datetime "updated_at", :null => false
    end
  end
end
