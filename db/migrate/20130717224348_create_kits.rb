class CreateKits < ActiveRecord::Migration
  def change
    create_table :kits do |t|
      t.string :image
      t.string :url
      t.string :title
      t.text :use_case

      t.timestamps
    end
  end
end
