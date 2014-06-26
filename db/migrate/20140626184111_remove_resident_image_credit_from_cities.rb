class RemoveResidentImageCreditFromCities < ActiveRecord::Migration
  def up
    remove_column :cities, :resident_image_credit
  end

  def down
    add_column :cities, :resident_image_credit, :string
  end
end
