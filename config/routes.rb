require 'sidekiq/web'

Rails.application.routes.draw do

  root 'dashboard#index'
  resources :teams
  resources :users
  resources :event_groups
  resources :events
  resources :todos
  resources :repositories
  resources :sounds

  scope :api, only: [:index, :show], format: true, constraints: { format: 'json' } do
    resources :teams
    resources :users
    resources :event_groups
    resources :repositories
  end

  mount Sidekiq::Web => '/sidekiq'
end
