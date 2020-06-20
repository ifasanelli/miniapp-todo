Rails.application.routes.draw do
  devise_for :users
  resources :favorites
  resources :tasks do
    put :set_done
    put :set_undone
  end
  resources :task_lists do
    put :set_public
    put :set_private
  end
  get '/discovery', to: 'task_lists#discovery'
  root to: 'task_lists#index'
end
