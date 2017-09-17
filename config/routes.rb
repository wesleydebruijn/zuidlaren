Rails.application.routes.draw do
  resources :teams
  resources :users

  root 'dashboard#index'
end
