class NotificationPolicy < ApplicationPolicy

def mark_as_seen?
  true
end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
