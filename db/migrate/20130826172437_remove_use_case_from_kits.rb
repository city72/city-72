class RemoveUseCaseFromKits < ActiveRecord::Migration
  def up
    remove_column :kits, :use_case
  end

  def down
    add_column :kits, :use_case, :text
  end
end
