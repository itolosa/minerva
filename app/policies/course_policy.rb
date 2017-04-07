class CoursePolicy < ApplicationPolicy
  def index?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  def update?
    user == record.user || user.admin? || record.moderations.exists?(user: user)
  end

  def show?
    true
  end

  def edit?
    update?
  end

  def destroy?
    user == record.user || user.admin?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end