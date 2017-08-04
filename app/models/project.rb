class Project < ApplicationRecord
  has_secure_token


  belongs_to :owner, class_name: 'User'
  has_many :project_users, dependent: :destroy
  has_many :users, through: :project_users

  after_create :add_owner_to_user_list  

  private

  def add_owner_to_user_list
    self.users << owner
  end
end
