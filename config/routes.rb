require 'sidekiq/web'

Rails.application.routes.draw do

  root 'dashboard#index'
  resources :teams
  resources :users
  resources :event_groups
  resources :events
  resources :todos
  resources :repositories
  resources :sounds do
    post 'play/:slug', to: 'sounds#play', as: :play, on: :collection
    get 'stop', to: 'sounds#stop', on: :collection
    get 'start', to: 'sounds#start', on: :collection
  end

  scope :api, only: [:index, :show], format: true, constraints: { format: 'json' } do
    resources :teams
    resources :users
    resources :event_groups
    resources :repositories
  end

  mount Sidekiq::Web => '/sidekiq'
end
