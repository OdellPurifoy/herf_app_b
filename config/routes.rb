Rails.application.routes.draw do
  resources :lounges
  devise_for :users
  root 'home#index'
end
