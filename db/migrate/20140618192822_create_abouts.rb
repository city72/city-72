class CreateAbouts < ActiveRecord::Migration
  def change
    create_table :abouts do |t|
      t.string :brought_to_you_by

      t.timestamps
    end
  end
end
