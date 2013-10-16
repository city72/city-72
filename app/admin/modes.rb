ActiveAdmin.register Mode do
	menu :label => "In an Emergency"
	actions :all, :except => [:destroy, :new]
  	config.paginate = false

	form do
		render "edit"
	end

	controller do
		before_filter :validate_params_length, only: :update

    def index
  		mode = CurrentMode.get_current_mode
  		redirect_to edit_admin_mode_path mode
		end

		def update
			mode_action = params[:mode_action]

			if mode_action == "switch-on" || mode_action == "switch-off"
				CurrentMode.toggle_mode
			end

			@mode = CurrentMode.get_current_mode
			
			if mode_action == "update" || mode_action == "switch-on"
				@mode.update_attributes(params[:mode])
				
				feed = CitizenFeed.first
				feed.update_attributes!(params[:feed])
			end
			
			redirect_to edit_admin_mode_path(@mode)
		end

		def edit
			@is_crisis_mode = CurrentMode.is_crisis_mode
			@mode = CurrentMode.get_current_mode
			@last_crisis_mode_info = Mode.last_crisis_mode_info
			@feed = CitizenFeed.first
		end

		private
			def params_with_invalid_size?
				params[:mode][:text].size > 255 || params[:mode][:title].size > 255
			end

			def validate_params_length
				if params[:mode_action] == "switch-on" && params_with_invalid_size?
					flash[:errors] = "text values can't be longer than 255 characters"
					redirect_to edit_admin_mode_path(@mode)
				end
			end
  end
end
