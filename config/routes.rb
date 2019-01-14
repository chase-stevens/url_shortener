Rails.application.routes.draw do
  get 'home/index'
  get '/urlindex', to: 'urls#index'
  get '/:short', to: 'urls#show'

  resources :urls, param: :short

  root 'home#index'
end
