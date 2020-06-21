class FavoritesController < ApplicationController
  def index
    @favorites = current_user.favorites
                             .map(&:task_list)
  end

  def create
    @favorite = Favorite.create(task_list_id: params[:task_list_id])
    @favorite.user = current_user
    @favorite.save
    flash[:notice] = 'Lista favoritada!'
    redirect_to task_list_path(@favorite.task_list)
  end

  def destroy
    @favorite = Favorite.find_by(task_list_id: params[:task_list_id], user_id: current_user.id)
    @favorite.destroy
    flash[:alert] = 'Lista desfavoritada!'
    redirect_back(fallback_location: task_list_path(params[:task_list_id]))
  end
end