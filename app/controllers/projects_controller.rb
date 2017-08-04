class ProjectsController < ApplicationController
  def index
    @owned_projects = current_user.owned_projects
  end

  def show
    @project = Project.find params[:id]
  end

  def edit
  end
end
