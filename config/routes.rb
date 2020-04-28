Rails.application.routes.draw do
  root to: 'posts#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  get 'logout', to: 'sessions#destroy'

  resources :posts, except: :index
end
