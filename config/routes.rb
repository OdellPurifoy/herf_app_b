# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  devise_for :users

  resources :events do
    resources :rsvps, shallow: true
  end

  resources :lounges do
    resources :events, shallow: true
  end

  get 'my_lounge', to: 'lounges#my_lounge'
end
