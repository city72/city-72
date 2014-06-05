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

  scope "/admin" do
    root to: "admin_landing#index"

    resources :city_info, only: [:index]
  end

end
