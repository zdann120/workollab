class ProjectUser < ApplicationRecord
  belongs_to :project
  belongs_to :user

  attribute :access_level, :integer
  
  def assigned_tasks
    project.tasks.where(assignee: user)
  end

  enum access_level: [:owner, :collaborator, :viewer]
end
