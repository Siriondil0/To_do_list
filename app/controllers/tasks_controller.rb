class TasksController < ApplicationController

  def new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to root_path
      flash[:notice] = "Task created"
    else
      redirect_to root_path
      flash[:notice] = "Please try again"
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
  end

  def index
    @tasks = Task.all
  end

  def delete
  end


  private

  def task_params
    params.permit(:title, :deadline, :description)
  end

end
