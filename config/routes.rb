IdeoSf72::Application.routes.draw do

  post "map_marker/create"

  get "map_marker" => "map_marker#index"

  root to: 'home#home'

  get "prepare" => "home_controller#prepare"
  
  get "home" => "home#home"

  get "connect" => "home#connect"

  get "stories" => "home_controller#stories"

  get "things" => "home_controller#things"

  get "story_detail" => "home_controller#story_detail"

  get "about" => "home#about"
  
end
