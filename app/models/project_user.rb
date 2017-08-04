class ProjectUser < ApplicationRecord
  belongs_to :project
  belongs_to :user

  enum access_level: [:owner, :collaborator, :viewer]
end
