ActiveAdmin.register Feed do
	actions :all, :except => [:destroy, :new, :show]
  	config.paginate = false

	index do
		selectable_column
		column :type
		column :widget_id
		default_actions
	end

	form do |f|
		f.inputs "copy-paste the number from widgets data-widget-id" do
			f.input :widget_id
		end
		f.actions
	end
end
