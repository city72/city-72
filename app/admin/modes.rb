ActiveAdmin.register Mode do
  config.paginate = false

	index do
		selectable_column
		column :em_mode, Proc.new {|obj| obj.em_mode? ? 'Yes' : 'No'}
		column :title
		column :text
		default_actions
	end
end
