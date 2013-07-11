IdeoSf72::Application.routes.draw do

  root to: 'home_controller#home'

  get "home" => "home_controller#home"

  get "connect" => "home_controller#connect"

  get "prepare" => "home_controller#prepare"

  get "about" => "home_controller#about"

  get "stories" => "home_controller#stories"

  get "things" => "home_controller#things"

  get "story_detail" => "home_controller#story_detail"
  
end
