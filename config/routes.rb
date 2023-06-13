Rails.application.routes.draw do
  resources :events
  resources :lounges
  devise_for :users
  root 'home#index'
  get 'my_lounge', to: 'lounges#my_lounge'
end
