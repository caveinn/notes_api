Rails.application.routes.draw do
  resources :users
  # login
  post 'auth/login', to: 'authentication#authenticate'
  # signup
  post 'auth/signup', to: 'users#create'
end
