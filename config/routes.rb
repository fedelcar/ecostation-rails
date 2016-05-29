Ecostation::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users
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

  get 'payments/vinti' => 'vinti#index'
  post 'payments/vinti' => 'vinti#create'

  get 'payments/voucher/create' => 'vouchers#create'
  get 'payments/voucher' => 'vouchers#index'
  post 'payments/voucher' => 'vouchers#new'
  get 'payments/voucher/:id' => 'vouchers#show', :as => :show_voucher
 
  get 'faq', to: 'statics#faq'
  root to: 'statics#home'

  require 'sidekiq/web'
  mount Sidekiq::Web, at: 'sidekiq'
  mount PgHero::Engine, at: 'pghero'
end
