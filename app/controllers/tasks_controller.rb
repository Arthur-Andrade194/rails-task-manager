class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @tasks = Task.find(params[:id])
  end

  #will route to tasks/id

  def new
    @task = Task.new
    #display the Task form in html
  end


  def create
    #equest generated when submitting this form
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task)
    else
      # display the form page again
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      # display the form page again
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  # strong params -> white listing the info coming from the form
  def task_params
    params.require(:task).permit(:title, :details)
  end

end
