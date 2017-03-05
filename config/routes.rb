Rails.application.routes.draw do

  devise_for :users
  devise_scope :user do
    root 'sessions#new'
    get '/login' => 'sessions#new'
    get '/logout' => 'sessions#destroy'
    get '/signup' => 'registrations#new'
  end

  resources :stories

  scope '/admin' do
    resources :access_codes, only: [:index, :create, :destroy]
  end

  resources :users
  get 'details' => 'users#details'

  namespace :api do
    namespace :v1 do
      resources :stories, only: [:update] do
        post :add_tag, on: :member
        post :remove_tag, on: :member
      end
    end
  end
end
