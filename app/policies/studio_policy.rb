class StudioPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    # everyone can view a studio, so show? is always true
    true
  end

  def create?
    # only the logged in user are allowed to create the studio
    true
  end

  def edit?
    raise
    update?
  end

  def update?
    # only the logged in user are allowed to update the restaurant
    user_is_owner?
  end

  def destroy?
    # only the logged in user are allowed to destroy the restaurant
    user_is_owner?
  end

  private

  def user_is_loggedin?
    user == record.user
  end
end
