Rails.application.routes.draw do
  get 'users/new'

  get 'users/create'

  get 'users/edit'

  get 'users/update'

  get 'users/destroy'

  get 'bookings/index'

  get 'bookings/show'

  get 'bookings/new'

  get 'bookings/create'

  get 'bookings/edit'

  get 'bookings/update'

  get 'bookings/destroy'

  get 'dives/index'

  get 'dives/show'

  get 'dives/new'

  get 'dives/create'

  get 'dives/edit'

  get 'dives/update'

  get 'dives/destroy'

  devise_for :users
  root to: 'pages#home'

  resources :users

  resources :dives do
    resources :bookings
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
