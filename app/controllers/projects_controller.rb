class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @owned_projects = current_user.owned_projects
  end

  def show
    @project = Project.includes(:owner).find(params[:id])
    authorize @project
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

  def destroy
    @project = Project.find params[:id]
    if @project.destroy
      redirect_to projects_url, notice: "Project [ID: #{@project.id}] has been deleted."
    else
      redirect_to @project, alert: 'This project could not be deleted.'
    end
  end

  def add_user
    @project = Project.find params[:project_id]
    @outcome = Projects::AddUser.run(user_params)

    if @outcome.valid?
      redirect_to @project, notice: 'User added!'
    else
      flash.now.alert = 'One or more errors prevented this user from being added.'
      render :show
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :start_date)
  end

  def user_params
    params.require(:user).permit(:access_level, :email).merge!({project: @project})
  end
end
