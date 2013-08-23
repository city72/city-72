ActiveAdmin.register Mode do
	menu :label => "Crisis Mode"
	actions :all, :except => [:destroy, :new]
  	config.paginate = false

	form do
		render "edit"
	end

	controller do
      	def index
      		mode = CurrentMode.getCurrentMode
      		redirect_to edit_admin_mode_path mode
  		end

		def update

			mode_action = params[:mode_action]

			if mode_action == "switch-on" || mode_action == "switch-off"
				CurrentMode.toggleMode
			end

			mode = CurrentMode.getCurrentMode
			
			if mode_action == "update" || mode_action == "switch-on"
				mode.update_attributes(params[:mode])
				
				feed = CitizenFeed.first
				feed.update_attributes!(params[:feed])
			end
			
			redirect_to edit_admin_mode_path(mode)
		end

		def edit
			@isCrisisMode = CurrentMode.isCrisisMode
			@mode = CurrentMode.getCurrentMode
			@feed = CitizenFeed.first
		end
    end
end
