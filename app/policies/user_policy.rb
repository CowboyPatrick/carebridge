class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def dashboard?
    true
  end

  def show?
    true
  end

  def get_id?
    true
  end
end
