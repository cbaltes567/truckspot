Rails.application.routes.draw do
  resources :favorites
  resources :vehicles
  resources :reviews
  resources :reservations
  resources :garages
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
