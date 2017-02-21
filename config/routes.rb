Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :users, except: :index do
    resources :bookings
  end

  resources :dives
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
