class ProjectUser < ApplicationRecord
  belongs_to :project
  belongs_to :user

  attribute :access_level, :integer, default: 2

  enum access_level: [:owner, :collaborator, :viewer]


  def assigned_tasks
    project.tasks.where(assignee: user)
  end

end
