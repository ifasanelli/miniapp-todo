Rails.application.routes.draw do
  devise_for :users
  resources :favorites
  resources :tasks
  resources :task_lists
  root to: 'task_lists#index'
end
