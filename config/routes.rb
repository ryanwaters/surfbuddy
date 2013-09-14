Surfbuddy::Application.routes.draw do
  
  get "sessions/new"
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#login', as: 'login'  
  get 'logout', to: 'sessions#destroy', as: 'logout'

  match '/auth/google_oauth2/callback' to: 'sessions#create'

  root to: 'sessions#login'
  
  resources :users do 
    resources :messages
  end

  resources :sessions
  resources :posts
  resources :comments
  resources :conditions
  

end
