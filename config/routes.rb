Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :studios, only: %i[index show new create] do
    resources :bookings, only: %i[new create]
  end
  resources :bookings, only: %i[index edit update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
