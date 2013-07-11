IdeoSf72::Application.routes.draw do

  root to: 'home_controller#home'

  get "home" => "home_controller#home"

  get "connect" => "home_controller#connect"

  get "prepare_landing" => "home_controller#prepare_landing"

  get "about" => "home_controller#about"

  get "prepare_people" => "home_controller#prepare_people"

  get "prepare_things" => "home_controller#prepare_things"

  get "prepare_people_detail" => "home_controller#prepare_people_detail"
  
end
