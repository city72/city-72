City72::Application.routes.draw do

  devise_scope :admin_user do
    get "/admin_users/sign_up", :to => "home#index"
  end

  devise_for :admin_users, :controllers => {
    # this way we can avoid user's to register
    :registrations => "registrations"
  }

  resources :stories, only: [:index]

  root to: 'home#index'

  get "prepare" => "home#prepare"
  get "home" => "home#home"
  get "em/home" => "home#em_home"
  get "connect" => "home#connect"
  get "supplies" => "home#supplies"
  get "about" => "home#about"
  get "em" => "emergency_mode#index"
  get "quick_guide" => "home#quick_guide"
  get "our_manifesto" => "home#our_manifesto"
  post "emails" => "emails#send_email"
  get "plan" => "home#plan"

  namespace :cms do
    root to: "landing#index"

    get "directives/network_modal"
    get "directives/affiliate_form"
    get "directives/resource_modal"
    get "directives/supply_modal"
    get "directives/story_modal"

    resource :city, only: [:show] do
      collection do
        put "residents/:id" => "cities#update_resident_image"
      end
    end
    put "city/:id" => "cities#update"

    resource :city_connections, only: [:show, :update]

    resources :city_network, only: [:update]
    resources :city_resource, only: [:update]

    resource :supplies, only: [:show] do
      collection do
        put "kit/:id" => "supplies#update_kit"
      end
    end
    put "supplies/:id" => "supplies#update"

    resource :stories, only: [:show] do
      collection do
        put "city/:id" => "stories#update_statement"
      end
    end
    put "stories/:id" => "stories#update"

    resource :plan, only: [:show, :update]
    resource :about, only: [:show, :update]
    resource :analytic, only: [:show, :update]
    resource :map, only: [:show, :update]

    put "modes/turn_on"
    put "modes/turn_off"

  end

end
