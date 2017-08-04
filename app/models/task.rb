class Task < ApplicationRecord
  belongs_to :assignee, class_name: 'User'
  belongs_to :project

  validates :description, presence: true
end
