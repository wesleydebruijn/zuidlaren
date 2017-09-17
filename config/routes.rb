Rails.application.routes.draw do

  resources :teams
  resources :users
  resources :event_groups
  resources :events

  root 'dashboard#index'
end
