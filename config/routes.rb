Rails.application.routes.draw do
  resources :schools
  resources :users
  # login
  post 'auth/login', to: 'authentication#authenticate'
  # signup
  post 'auth/signup', to: 'users#create'

  resources :schools do
    resources :streams
  end

  resources :schools do
    resources :streams do
      resources :notes
    end
  end
end
