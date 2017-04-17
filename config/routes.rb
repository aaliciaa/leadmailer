Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :leads, only: [:index, :new, :create, :edit, :update, :destroy]

  patch "leads/:id", to: "leads#mark_as_settled", as: "mark_settled"
  patch "leads/:id", to: "leads#mark_as_lost", as: "mark_lost"

  patch "users/:id", to: "users#toogle_availability", as: "toggle_availability"
end
