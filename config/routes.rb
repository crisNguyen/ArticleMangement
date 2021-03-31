Rails.application.routes.draw do

  root 'pages#home'
  get 'about', to: 'pages#about'

  resources  :articles

  get 'signup',to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessionns#new'
  post 'login',to: 'sessionns#create'
  delete 'logout',to: 'sessionns#destroy'



end
