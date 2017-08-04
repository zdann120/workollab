Rails.application.routes.draw do
  resources :projects do
    resources :tasks, except: [:index, :destroy],
      controller: 'project/tasks'
  end

  get 'visitors/index'

  devise_for :users
  root 'visitors#index'
end
