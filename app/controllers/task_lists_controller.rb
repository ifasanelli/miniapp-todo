class TaskListsController < ApplicationController
  def index
    @task_lists = current_user.task_lists
  end

  def show
    @task_list = TaskList.find(params[:id])
  end
end