class Project::TaskPolicy < ApplicationPolicy
  def create?
    record.last.project.users.include? user
  end

  def update?
    record.last.project.users.include? user
  end
  class Scope < Scope
    def resolve
      scope
    end
  end
end
