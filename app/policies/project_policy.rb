class ProjectPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    user_on_access_list?
  end

  def update?
    user == record.owner
  end

  def create?
    true
  end

  def destroy
    user == record.owner
  end
  class Scope < Scope
    def resolve
      scope
    end
  end

  private

  def user_on_access_list?
   (record.project_users.map{|pu| pu.user}).include?(user)
  end
end
