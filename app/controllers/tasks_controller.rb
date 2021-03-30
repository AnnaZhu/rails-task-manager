# TaskController
class TasksController < ApplicationController
  def index
    @tasks = Task.all
    # if @tasks.completed == true
    #   '✅ This task is completed'
    # else
    #   '◽ This task is not completed'
    # end
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      @task = Task.new(task_params)
    end
  end

  def new
    @task = Task.new
  end

  def detail
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path(@task)
    else
      @task = Task.find(params[:id])
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    # paras[:task]
    params.require(:task).permit(:title, :details)
  end

end

