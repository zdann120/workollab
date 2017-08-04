class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :owned_projects, class_name: 'Project', foreign_key: 'owner_id'
  has_many :project_users
  has_many :projects, through: :project_users
  has_many :tasks, foreign_key: 'assignee_id'

  validates :email, email: true
end
