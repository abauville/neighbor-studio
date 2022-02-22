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
    # only the studio's owner are allowed to create the restaurant
    true
  end

  def update?
    # only the studio's owner are allowed to update the restaurant
    user_is_owner?
  end

  def destroy?
    # only the studio's owner are allowed to destroy the restaurant
    user_is_owner?
  end

  private

  def user_is_owner?
    user == record.user
  end
end
