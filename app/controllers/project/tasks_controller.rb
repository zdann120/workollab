class Project::TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, only: [:show, :edit, :update]
  def show

  end

  def new
    @task = @project.tasks.new
  end

  def create
    @task = @project.tasks.new(task_params)
    
    if @task.save!
      redirect_to @project, notice: 'Task has been added!'
    else
      render :new
    end
  end

  def edit
  end

  private

  def task_params
    params.require(:task).permit(:description, :assignee_id)
  end

  def set_project
    @project = Project.find params[:project_id]
  end

  def set_task
    @task = Task.find params[:id]
  end
end
