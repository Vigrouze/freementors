class MissionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # def index?
  #   return true
  # end

  def show?
    true
  end

  def create?
    return false
  end

  def finished?
    true
  end

end
