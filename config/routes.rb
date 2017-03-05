Rails.application.routes.draw do

  root 'users#landing'

  devise_for :users
  devise_scope :user do
    get '/login' => 'sessions#new'
    get '/logout' => 'sessions#destroy'
    get '/signup' => 'registrations#new'
  end

  resources :stories
  get 'support' => 'stories#support'
  get 'hug' => 'stories#hug'
  get 'reachout' => 'stories#reachout'

  scope '/admin' do
    resources :access_codes, only: [:index, :create, :destroy]
  end

  resources :users
  get 'code_of_conduct' => 'users#code_of_conduct'
  post 'code_of_conduct' => 'users#code_of_conduct'
  get 'details' => 'users#details'

  namespace :api do
    namespace :v1 do
      resources :stories, only: [] do
        post :add_tag, on: :member
        post :remove_tag, on: :member
        post :save, on: :member
      end
    end
  end
end
