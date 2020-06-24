Rails.application.routes.draw do
  devise_for :users
  resources :task_lists do
    put :set_public
    put :set_private
    put :create_task
    resources :tasks do
      put :set_done
      put :set_undone
    end
  end
  resources :favorites
  get '/discovery', to: 'task_lists#discovery'
  root to: 'task_lists#index'
end
