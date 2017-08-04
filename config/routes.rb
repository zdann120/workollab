Rails.application.routes.draw do
  resources :projects

  get 'visitors/index'

  devise_for :users
  root 'visitors#index'
end
