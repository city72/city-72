City72::Application.routes.draw do

  devise_for :admin_users

  resources :stories, only: [:index, :show]

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

    resource :city, only: [:show, :update]
    resource :city_connections, only: [:show, :update]
    resources :supplies, only: [:index]
    resources :stories, only: [:index]
    resources :plan, only: [:index]
    resources :about, only: [:index]
    resources :map, only: [:index]
    resources :updates, only: [:index]
  end

end
