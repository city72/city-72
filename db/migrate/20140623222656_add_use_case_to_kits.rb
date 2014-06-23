class AddUseCaseToKits < ActiveRecord::Migration
  def change
    add_column :kits, :use_case, :string
  end
end
