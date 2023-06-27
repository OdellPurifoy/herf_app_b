# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  
  resources :events do
    resources :rsvps, shallow: true
  end
  
  resources :lounges do
    resources :events, shallow: true
    resources :memberships, shallow: true
    resources :special_offers, shallow: true
  end

  resources :memberships do
    member do
      post :activate
      post :deactivate
    end
  end

  get 'my_lounge', to: 'lounges#my_lounge'
end
