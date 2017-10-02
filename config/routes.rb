require 'sidekiq/web'

Rails.application.routes.draw do

  resources :teams
  resources :users
  resources :event_groups
  resources :events
  resources :todos
  resources :repositories

  root 'dashboard#index'

  mount Sidekiq::Web => '/sidekiq'
end
