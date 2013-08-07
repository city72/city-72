ActiveAdmin.register Feed do
	actions :all, :except => [:destroy, :new]
	config.paginate = false

	form do
		render "edit"
	end

	controller do
		def index
			redirect_to "/admin/feeds/1/edit"
		end

		def update
			@feed = CitizenFeed.first
			@feed.update_attributes(params[:feed])
			redirect_to "/admin/feeds/1"
		end

		def edit
			@feed = CitizenFeed.first
		end
	end
end
