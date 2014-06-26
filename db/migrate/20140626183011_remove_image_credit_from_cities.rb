class RemoveImageCreditFromCities < ActiveRecord::Migration
  def up
    remove_column :cities, :image_credit
  end

  def down
    add_column :cities, :image_credit, :string
  end
end
