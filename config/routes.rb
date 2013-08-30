Surfbuddy::Application.routes.draw do
  
  get "sessions/new"
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'  
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root to: 'sessions#login'
  
  resources :users do 
    resources :messages
  end
    
  resources :sessions
  resources :posts
  resources :comments
  

end
