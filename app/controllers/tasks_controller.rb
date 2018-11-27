# Task controller definition
class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show; end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params_create)
    @task.save

    redirect_to :root
  end

  def edit; end

  def update
    @task.update(task_params_update)

    redirect_to :root
  end

  def destroy
    @task.destroy

    redirect_to :root
  end

  private

  def task_params_create
    params.require(:task).permit(:title, :details)
  end

  def task_params_update
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
