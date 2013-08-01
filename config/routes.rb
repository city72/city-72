IdeoSf72::Application.routes.draw do

  resources :kits


  resources :items

  root to: 'home#home'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  post "map_marker/create"

  delete "map_marker/delete"

  get "map_marker/:ne_lon/:ne_lat/:sw_lon/:sw_lat" => "map_marker#markers_within_bounds", :constraints => { :ne_lon => /.*/, :ne_lat => /.*/, :sw_lon => /.*/, :sw_lat => /.*/ }

  get "map_marker" => "map_marker#index"


  get "prepare" => "home#prepare"
  
  get "home" => "home#home"
  get "em/home" => "home#em_home"
  get "em/home_tour" => "home#em_home_tour"

  get "connect" => "home#connect"

  get "things" => "home#things"

  get "about" => "home#about"

  resources :stories

  get "em" => "emergency_mode#index"

  get "quake_guide" => "home#quake_guide"
  
end
