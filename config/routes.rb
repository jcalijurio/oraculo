Oraculo::Application.routes.draw do |map|
  devise_for :users

  map.connect 'answers/bestanswer/:id', { :controller => 'answers', :action => 'bestanswer' }
  #map.connect 'answers/edit/:id', { :controller => 'answers', :action => 'edit' }

  resources :questions do
    resources :answers
  end
  resources :answers

  root to: "questions#index"
end

