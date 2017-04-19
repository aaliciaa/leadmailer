Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
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

end
