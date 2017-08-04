class ProjectsController < ApplicationController
  def index
    @owned_projects = current_user.owned_projects
  end

  def show
    @project = Project.find params[:id]
  end

  def new
    @project = current_user.owned_projects.new
  end

  def create
    @project = current_user.owned_projects.new(project_params)

    if @project.save!
      redirect_to @project, notice: 'Project created successfully!'
    else
      flash.now.alert = 'One or more errors prevented the project from being saved.'
      render :new
    end
  end

  def edit
    @project = Project.find params[:id]
  end

  def update
    @project = Project.find params[:id]

    if @project.update(project_params)
      redirect_to @project, notice: 'Project updated successfully!'
    else
      flash.now.alert = 'One or more errors prevented this project from being updated. Please try again.'
      render :edit
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :start_date)
  end
end
