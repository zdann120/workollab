class Projects::AddUser < ActiveInteraction::Base
  object :project
  string :email
  string :access_level, default: 'viewer'

  def execute
    user = User.find_by_email(email)

    if user
      if project.users.include?(user)
        errors.add(:email, 'already has access.')
        return false
      end
      project_user = project.project_users.new
      project_user.user = user
      project_user.access_level = access_level

      if project_user.save
        project_user
      else
        errors.add(:user, 'could not be added.')
        errors.merge! project_user.errors
      end
    else
      errors.add(:email, 'does not belong to a registered user.')
    end
  end
end
