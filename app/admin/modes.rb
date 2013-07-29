ActiveAdmin.register Mode do
  config.paginate = false

	index do
		selectable_column
		column :em_mode
		column :text
		default_actions
	end
end
