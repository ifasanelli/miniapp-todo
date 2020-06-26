class TasksController < ApplicationController
  def set_done
    @task = Task.find(params[:task_id])
    @task.update(status: :closed)
    flash[:alert] = "'#{@task.description}' marcada como feita"
    redirect_to task_list_path(@task.task_list)
  end

  def set_undone
    @task = Task.find(params[:task_id])
    @task.update(status: :open)
    flash[:alert] = "'#{@task.description}' desmarcada como feita"
    redirect_to task_list_path(@task.task_list)
  end

  def destroy
    @task = Task.find(params[:id])
		@task.destroy
		redirect_to edit_task_list_path(params[:task_list_id])
	end
end
