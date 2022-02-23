class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user: user)
    end
  end

  def create?
    !user_is_host?
  end

  def update?
    user_is_musician? || user_is_host?
  end

  private

  def user_is_musician?
    user == record.user
  end

  def user_is_host?
    user == record.studio.user
  end
end
