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

  namespace :api, only: [:index, :show] do
    resources :teams
    resources :users, param: :github_username
    resources :event_groups, param: :name
    resources :repositories, param: :slug
  end

  namespace :auth do
    get :login
    post :authenticate
    get :callback
    get :logout
  end

  mount Sidekiq::Web => '/sidekiq'
end
