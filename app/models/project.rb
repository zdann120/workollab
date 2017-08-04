class Project < ApplicationRecord
  has_secure_token


  belongs_to :owner, class_name: 'User'
  has_many :project_users, dependent: :destroy
  has_many :users, through: :project_users
  has_many :tasks

  after_create :add_owner_to_user_list  

  private

  def add_owner_to_user_list
    project_user = self.project_users.new
    project_user.user = owner
    project_user.access_level = :owner
    project_user.save
  end
end
