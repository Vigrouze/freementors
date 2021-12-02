class RelationshipPolicy < ApplicationPolicy

  def create?
    true
  end

  def approve?
    user.mentor?
  end

  def decline?
    user.mentor?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

end
