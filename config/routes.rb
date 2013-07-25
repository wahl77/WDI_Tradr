RailsProject::Application.routes.draw do
  get "userstockinfos/create"

  root :to => 'static_pages#index'
  resources :users
  resources :user_sessions
  resources :stocks
  resources :userstockinfos
  
  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
end
