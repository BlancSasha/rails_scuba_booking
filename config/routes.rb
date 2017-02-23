Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  patch '/users/:id', to: 'users#update_teacher_status', as: 'teacher'

  resources :users, except: [:index] do
    resources :bookings, except: [:new]
  end

  resources :dives, only: [:index, :show]

  namespace :guide do
    resources :dives, except: [:show]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Attachinary::Engine => "/attachinary"
end
