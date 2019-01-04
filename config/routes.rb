Rails.application.routes.draw do
  resources :users
  resources :sessions ,only:[:new, :create, :destroy]
  resources :account_activations, only: [:edit]

  root 'static_pages#home'
  get  'static_pages/help'
  get  'signup', to: 'users#new'
  get  'signin', to: 'sessions#new'
end
