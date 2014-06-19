class ChangeEmergencyTypeForQuickGuideFromPlan < ActiveRecord::Migration
  def change
    remove_column :plans, :emergency_type_cd
    add_column :plans, :quick_guide_id, :integer
  end
end
