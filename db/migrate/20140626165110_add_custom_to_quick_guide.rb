class AddCustomToQuickGuide < ActiveRecord::Migration
  def change
    add_column :quick_guides, :custom, :boolean, :nullable => false, :default => false
  end
end
