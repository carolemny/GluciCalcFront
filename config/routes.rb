Rails.application.routes.draw do
  resources :quantities
  resources :foods
  resources :meals
  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations',
             }
  resources :users, except: [:create, :index]
  resources :password, only: [:index]
  post 'password/forgot', to: 'password#forgot'
  post 'password/reset', to: 'password#reset'
end
