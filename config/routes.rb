Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :studios, only: %i[index show new create edit update] do
    resources :bookings, only: %i[new create]
  end
  namespace :owner do
    resources :bookings, only: :index
    resources :studios, only: :index
  end
  resources :bookings, only: %i[index edit update] do
    member do
      patch :accept
      patch :refuse
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
