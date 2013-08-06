class Addfeeds < ActiveRecord::Migration
  def change
  	create_table :feeds do |t|
  		t.string :widget_id
  		t.string :type
  		
  		t.timestamps
  	end
  end
end
