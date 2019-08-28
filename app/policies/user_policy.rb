class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
 end

  def panel?
    record == user
  end
end
