IdeoSf72::Application.routes.draw do

  resources :suscriptions
  resources :kits
  resources :items
  resources :stories

  root to: 'home#home'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get "prepare" => "home#prepare"
  
  get "home" => "home#home"
  get "em/home" => "home#em_home"
  get "em/home_tour" => "home#em_home_tour"

  get "connect" => "home#connect"

  get "things" => "home#things"

  get "about" => "home#about"

  get "em" => "emergency_mode#index"

  get "quick_guide" => "home#quick_guide"

  get "our_manifesto" => "home#our_manifesto"

  post "emails" => "emails#send_email"
  
end
