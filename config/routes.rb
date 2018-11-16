Rails.application.routes.draw do
  root 'static_pages#home'
  get  'static_pages/help'
  get  'sign_up', to: 'users#sign_up'
end
