class AddEmergencyTypeCdToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :emergency_type_cd, :integer
  end
end
