ActiveAdmin.register Mode do
  config.paginate = false

	index do
		selectable_column
		column :em_mode
		default_actions
	end
end
