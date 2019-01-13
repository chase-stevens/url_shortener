Rails.application.routes.draw do
  get 'home/index'

  resources :urls

  root 'home#index'
end
