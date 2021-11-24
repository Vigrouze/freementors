class MissionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    return true
  end

  def show?
    return true
    # record.mentor == user || record.mentor.padawans.include?(user)
    # only the mentor or mentor's padawans can see the full offer
  end

  def create?
    return false
  end


end
