ActiveAdmin.register Mode do
	menu :label => "Crisis Mode"
	actions :all, :except => [:destroy, :new]
  	config.paginate = false

	form do
		render "edit"
	end

	controller do
      	def index
      		mode = CurrentMode.get_current_mode
      		redirect_to edit_admin_mode_path mode
  		end

		def update

			mode_action = params[:mode_action]

			if mode_action == "switch-on" || mode_action == "switch-off"
				CurrentMode.toggle_mode
			end

			mode = CurrentMode.get_current_mode
			
			if mode_action == "update" || mode_action == "switch-on"
				mode.update_attributes(params[:mode])
				
				feed = CitizenFeed.first
				feed.update_attributes!(params[:feed])
			end
			
			redirect_to edit_admin_mode_path(mode)
		end

		def edit
			@is_crisis_mode = CurrentMode.is_crisis_mode
			@mode = CurrentMode.get_current_mode
			@last_crisis_mode_info = Mode.last_crisis_mode_info
			@feed = CitizenFeed.first
		end
    end
end
