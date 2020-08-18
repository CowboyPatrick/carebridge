class ButtonPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.buttons
    end
  end


  def create?
    true 
  end

  def show?
    true
  end
end
