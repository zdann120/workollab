Rails.application.routes.draw do
  resources :projects do
    post 'add_user'
    resources :tasks, controller: 'project/tasks' do
      patch 'change_status', on: :member
    end
  end

  get 'visitors/index'

  devise_for :users
  root 'visitors#index'
end
