class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.orders
    end

  end

  def create?
    true
  end
  def show?
    true
  end
end
