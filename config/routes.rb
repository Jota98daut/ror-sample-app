Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :platforms, only: %i[index show]
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  root 'static_pages#home'
  get 'help', to: 'static_pages#help'
  get 'about', to: 'static_pages#about'
  get 'contact', to: 'static_pages#contact'

  resources :users, only: %i[index show]
  post '/users/subscription', to: 'users#subscribe', as: 'subscribe'
  delete '/users/subscription', to: 'users#unsubscribe', as: 'unsubscribe'

  resources :microposts, only: %i[create destroy]
  get '/microposts', to: 'static_pages#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
