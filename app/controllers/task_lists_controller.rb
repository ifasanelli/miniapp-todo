class TaskListsController < ApplicationController
  before_action :find_favorites, only: %i[show discovery]

  def index
    @task_lists = current_user.task_lists.order(created_at: :desc)
  end

  def show
    if !check_user?
      flash[:alert] = 'Você não tem acesso a esta lista!'
      redirect_to root_path
    else
      return @task_list, @favorites_ids
    end
  end

  def new
    @task_list = TaskList.new
    @task_list.tasks.build
  end

  def create
    @task_list = TaskList.new(task_list_params)
    @task_list.user = current_user
    if @task_list.save
      flash[:notice] = 'Lista criada!'
      redirect_to @task_list
    else
      render :new
    end
  end

  def edit
    if !check_user?
      flash[:alert] = 'Você não tem acesso a esta lista!'
      redirect_to root_path
    else
      return @task_list
    end
  end

  def update
    @task_list = TaskList.find(params[:id])
    if @task_list.update(task_list_params)
			redirect_to @task_list
		else
			render :edit
		end
  end

  def create_task
    @task_list = TaskList.find(params[:task_list_id])
    @task_list.update(task_list_params)
    redirect_to @task_list
  end

  def discovery
    @task_lists = TaskList.where(status: 5)
                          .where.not(user_id: current_user.id)
                          .order(created_at: :desc)
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

  def find_favorites
    @favorites = current_user.favorites.map(&:task_list)
    @favorites_ids = []
    @favorites.each { |item| @favorites_ids << item.id }
    return @favorites_ids
  end

  def task_list_params
    params.require(:task_list).permit(:name, :status, tasks_attributes: [:id, :description])
  end
end
