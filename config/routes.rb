Rails.application.routes.draw do
  devise_for :users
  resources :favorites
  resources :tasks
  resources :task_lists do
    put :set_public
    put :set_private
  end
  get '/discovery', to: 'task_lists#discovery'
  root to: 'task_lists#index'
end
