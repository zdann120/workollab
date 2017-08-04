class Project::TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, only: [:show, :edit, :update, :change_status]
  def show

  end

  def new
    @task = @project.tasks.new
    authorize [:project, @task]
  end

  def create
    @task = @project.tasks.new(task_params)
    authorize [:project, @task]

    if @task.save!
      redirect_to @project, notice: 'Task has been added!'
    else
      render :new
    end
  end

  def edit
    authorize [:project, @task]
  end

  def update
    authorize [:project, @task]
    if @task.update!(task_params)
      redirect_to @project, notice: 'Task updated.'
    else
      render :edit
    end
  end

  def change_status
    if @task.complete?
      @task.update(complete: false)
    else
      @task.update(complete: true)
    end
    redirect_to @project
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
