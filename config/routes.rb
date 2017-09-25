Rails.application.routes.draw do

  get 'searches/index'

  root to: "searches#index"

  resources :rests, only: [:index, :show, :create]
end
