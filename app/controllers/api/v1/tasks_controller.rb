class Api::V1::TasksController < Api::V1::BaseController
  before_action :set_task, only: [:show, :update, :destroy]

  def index
    tasks = @user.tasks
    render json: serialize(tasks)
  end

  def show
    render json: serialize(@task)
  end

  def create
    task = @user.tasks.build(task_params)
    if task.save
      render json: serialize(task)
    else
      render json: task.errors
    end
  end

  def update
    if @task.update(task_params)
      render json: serialize(@task)
    else
      render json: task.errors
    end
  end

  def destroy
    @task.destroy

    head :no_content
  end

  private

  def set_task
    @task = @user.tasks.find(params[:id])
  end

  def task_params
    params.permit(:title, :description, :status, :priority, :deadline)
  end
end