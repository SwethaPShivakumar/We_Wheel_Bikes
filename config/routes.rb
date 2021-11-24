Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :bikes do
    resources :bookings, only: [:new, :create]
    resources :reviews
    end
  get 'bikes/city', to: 'bikes#city_show'
end
