# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  devise_for :users
  
  resources :events do
    resources :event_flyers, only: [:destroy]
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

  resources :special_offers do
    resources :special_offer_flyers, only: [:destroy]
  end

  resources :subscriptions

  get 'my_lounge', to: 'lounges#my_lounge'
end
