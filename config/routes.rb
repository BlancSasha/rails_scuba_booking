Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  patch '/users/:id', to: 'users#update_teacher_status', as: 'teacher'

  resources :users, only: [:show] do
    resources :bookings
  end

  resources :dives

  namespace :guide do
    resources :dives, only: [:index, :new, :create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Attachinary::Engine => "/attachinary"
end
