class FavoritesController < ApplicationController
  def index
    @favorites = current_user.favorites
                             .map(&:task_list)
  end

  def create

  end

  def destroy

  end
end