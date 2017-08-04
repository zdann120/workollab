Rails.application.routes.draw do
  resources :projects do
    resources :tasks, 
      controller: 'project/tasks'
  end

  get 'visitors/index'

  devise_for :users
  root 'visitors#index'
end
