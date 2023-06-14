# frozen_string_literal: true

Rails.application.routes.draw do
  resources :lounges do
    resources :events, shallow: true
  end
  devise_for :users
  root 'home#index'
  get 'my_lounge', to: 'lounges#my_lounge'
end
