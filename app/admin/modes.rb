ActiveAdmin.register Mode do
	actions :all, :except => [:destroy, :new]
  	config.paginate = false

	index do
		selectable_column
		column :em_mode, Proc.new {|obj| obj.em_mode? ? 'Yes' : 'No'}
		column :title
		column :text
		default_actions
	end
end
