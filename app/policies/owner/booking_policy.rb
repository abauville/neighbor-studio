class Owner::BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # scope.where(user: user.bookings_as_owner)
      user.bookings_as_owner
    end
  end


end
