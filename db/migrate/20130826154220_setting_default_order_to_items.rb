class SettingDefaultOrderToItems < ActiveRecord::Migration
  def up
    Item.all.each do |item|
      item.order = 0
      item.save
    end
  end

  def down
  end
end
