class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.joins(:users).where("users.id = ?", user.id).distinct
    end

  end

  def create?
    true
  end
end
