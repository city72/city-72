class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :image
      t.string :title
      t.text :use_case
      t.string :category

      t.timestamps
    end
  end
end
