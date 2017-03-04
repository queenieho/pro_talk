Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :user do
  get '/login' => 'sessions#new'
  delete '/logout' => 'sessions#destroy'
  get '/signup' => 'registrations#new'
  end
end
