class Project < ApplicationRecord
  has_secure_token


  belongs_to :owner, class_name: 'User'
  has_many :project_users, dependent: :destroy
  has_many :users, through: :project_users
  has_many :tasks

  validates :title, presence: true

  after_create :add_owner_to_user_list  

  typed_store :settings, coder: DumbCoder do |s|
    s.boolean :enabled, default: true, null: false
    s.string :timezone, default: 'America/Phoenix', null: false
    s.boolean :collaborators_can_add_users, default: false, null: false
  end

  private

  def add_owner_to_user_list
    project_user = self.project_users.new
    project_user.user = owner
    project_user.access_level = :owner
    project_user.save
  end
end
