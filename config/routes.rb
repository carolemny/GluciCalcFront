Rails.application.routes.draw do
  resources :comments
  resources :favorites
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
  get 'days/:iso_date', to: 'meals#show_by_date'
  get 'food/:api_id', to: 'foods#show_by_api_id'
end
