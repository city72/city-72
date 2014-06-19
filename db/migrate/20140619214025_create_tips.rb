class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.belongs_to :quick_guide

      t.integer :moment_type_cd
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
