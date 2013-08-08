ActiveAdmin.register Mode do
	menu :label => "Crisis Mode"
	actions :all, :except => [:destroy, :new]
  	config.paginate = false

	form do
		render "edit"
	end

	controller do
      	def index
      		redirect_to "/admin/modes/1/edit"
  		end

		def update
			@mode = Mode.first
			@mode.em_mode = params[:mode][:em_mode] ? true : false
			@mode.update_attributes(params[:mode])
			redirect_to "/admin/modes/1"
		end

		def edit
			@mode = Mode.first
		end
    end
end
