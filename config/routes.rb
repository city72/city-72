IdeoSf72::Application.routes.draw do

  post "map_marker/create"

  delete "map_marker/delete"

  get "map_marker/:ne_lon/:ne_lat/:sw_lon/:sw_lat" => "map_marker#markers_within_bounds", :constraints => { :ne_lon => /.*/, :ne_lat => /.*/, :sw_lon => /.*/, :sw_lat => /.*/ }

  get "map_marker" => "map_marker#index"

  root to: 'home#home'

  get "prepare" => "home#prepare"
  
  get "home" => "home#home"

  get "connect" => "home#connect"

  get "stories" => "home#stories"

  get "things" => "home#things"

  get "story_detail" => "home#story_detail"

  get "about" => "home#about"
  
end
