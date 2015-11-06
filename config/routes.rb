Ecostation::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {registrations: 'registrations'}
  resources :users
  resources :positions
  resources :trades
  resources :companies
  resources :stations
  resources :prizes
  resources :transactions do
    collection do
      post :ecostation
    end
  end
  get 'faq', to: 'statics#faq'
  root to: 'statics#home'

  require 'sidekiq/web'
  mount Sidekiq::Web, at: 'sidekiq'
  mount PgHero::Engine, at: 'pghero'
end
