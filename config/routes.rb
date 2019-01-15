Rails.application.routes.draw do
  get 'home/index'
  resources :urls, param: :short
  get '/:short', to: 'urls#show'
  get '/:short/goto', to: 'urls#goto'

  root 'home#index'
end
