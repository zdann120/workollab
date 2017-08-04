class Project::SettingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :check_privileges
  def edit
  end

  def update
    if @project.update(settings_params)
      redirect_to @project, notice: 'Settings updated!'
    else
      flash.now.alert = 'There was an error, please try again.'
      render :edit
    end
  end

  private

  def settings_params
    params.require(:project).permit(:timezone, :collaborators_can_add_users,
                                   :enabled)
  end

  def check_privileges
    has_access = ProjectUser.exists?(project: @project, user: current_user,
                                   access_level: 'owner')
    unless has_access
      redirect_to @project, alert: 'Sorry, only the project owner can change the settings.'
    end
  end

  def set_project
    @project = Project.find params[:project_id]
  end
end
