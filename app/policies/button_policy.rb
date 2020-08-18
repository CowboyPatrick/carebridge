class ButtonPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.buttons
    end
  end

  def show?
    true
  end
end
