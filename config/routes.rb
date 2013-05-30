Bandmatch::Application.routes.draw do
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'

  resources :plans
  resources :concerts, only: [:index]

  root to: 'home#show'
end