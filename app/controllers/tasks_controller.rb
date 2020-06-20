class TasksController < ApplicationController
  def set_done
    @task = Task.find(params[:task_id])
    @task.update_attributes(status: :closed)
    flash[:alert] = "'#{@task.description}' marcada como feita"
    redirect_to task_list_path(@task.task_list)
  end

  def set_undone
    @task = Task.find(params[:task_id])
    @task.update_attributes(status: :open)
    flash[:alert] = "'#{@task.description}' desmarcada como feita"
    redirect_to task_list_path(@task.task_list)
  end
end