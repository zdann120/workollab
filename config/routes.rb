Rails.application.routes.draw do
  get 'visitors/index'

  devise_for :users
  root 'visitors#index'
end
