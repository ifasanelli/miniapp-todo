class TaskListsController < ApplicationController
  def index
    @task_lists = current_user.task_lists
  end

  def show
    if !check_user?
      flash[:alert] = 'Você não tem acesso a esta lista!'
      redirect_to root_path
    else
      return @task_list
    end
  end

  def discovery
    @task_lists = TaskList.where(status: 5)
  end

  def set_public
    @task_list = TaskList.find(params[:task_list_id])
    @task_list.update_attributes(status: :shared)
    flash[:alert] = "'#{@task_list.name}' agora é pública"
    redirect_to task_list_path(@task_list)
  end

  def set_private
    @task_list = TaskList.find(params[:task_list_id])
    @task_list.update_attributes(status: :personal)
    flash[:alert] = "'#{@task_list.name}' agora é privada"
    redirect_to task_list_path(@task_list)
  end

  private

  def check_user?
    @task_list = TaskList.find(params[:id])
    (@task_list.user == current_user || @task_list.shared?) ? true : false
  end
end