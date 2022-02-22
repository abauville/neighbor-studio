class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    # only logged in user are allowed to create the studio
    user_is_loggedin?
  end

  def create?
    # only logged in user are allowed to create the studio
    user_is_loggedin?
  end

  def update?
    # only logged in user are allowed to update the studio
    user_is_loggedin?
  end

  def destroy?
    # only logged in user are allowed to destroy the studio
    user_is_loggedin?
  end

  private

  def user_is_loggedin?
    user == record.user
  end
end
