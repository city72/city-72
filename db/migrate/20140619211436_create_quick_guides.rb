class CreateQuickGuides < ActiveRecord::Migration
  def change
    create_table :quick_guides do |t|
      t.string :title

      t.timestamps
    end
  end
end
