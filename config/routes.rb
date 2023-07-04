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
  get 'pricing', to: 'checkouts#price_listing'
  get 'success', to: 'checkouts#success'

  post 'create-monthly-email-checkout-session', to: 'checkouts#create_monthly_email_checkout_session'
  post 'create-monthly-email-and-text-checkout-session', to: 'checkouts#create_monthly_email_and_text_checkout_session'
  post 'create-yearly-email-checkout-session', to: 'checkouts#create_yearly_email_checkout_session'
  post 'create-yearly-email-and-text-checkout-session', to: 'checkouts#create_yearly_email_and_text_checkout_session'
end
