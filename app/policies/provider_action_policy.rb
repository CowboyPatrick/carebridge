class ProviderActionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.user.caregiver == user
  end

  def update?
    true
  end
end
