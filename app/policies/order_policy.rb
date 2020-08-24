class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.orders
    end

  end

  def create?
    true
  end
end
