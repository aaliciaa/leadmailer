Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  post "webhooks/postmark", to: "webhooks#postmark"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :leads, only: [:index, :new, :create, :edit, :update, :destroy] do
    member do
      patch :mark_as_settled
      patch :mark_as_lost
      patch :mark_as_accepted
    end
  end

  resources :users do
    member do
      patch :toggle_availability
    end
  end

  # static pages

  get 'styleguide', to: 'pages#styleguide'
  get 'simulate_email', to: 'leads#create_from_email'
  patch 'create_simulate_email', to: 'leads#create_new_from_email'
  get '/leads/:id/mark_as_accepted', to: 'leads#mark_as_accepted', as: 'accept_through_email'
  get 'storage', to: 'pages#storage'

end
