Rails.application.routes.draw do
  resources :properties
  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
end
