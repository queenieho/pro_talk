Rails.application.routes.draw do
  root 'stories#index'

  devise_for :users
  devise_scope :user do
    get '/login' => 'sessions#new'
    get '/logout' => 'sessions#destroy'
    get '/signup' => 'registrations#new'
  end

  resources :stories
  resources :users
  get 'details' => 'users#details'
end
