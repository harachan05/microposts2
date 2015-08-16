Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'signup',  to: 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get '/users/:id/followings' => 'users#followings'
  get '/users/:id/followeds' => 'users#followers'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts
  resources :relationships, only: [:create, :destroy]
  
  resources :users do
    get :followings, on: :member
    get :followers, on: :member
  end
end