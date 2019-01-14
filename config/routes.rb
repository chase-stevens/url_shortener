Rails.application.routes.draw do
  get 'home/index'
  get '/url_index', to: 'urls#index'
  get '/:short', to: 'urls#show'
  get '/:short/goto', to: 'urls#goto'

  resources :urls, param: :short

  root 'home#index'
end
