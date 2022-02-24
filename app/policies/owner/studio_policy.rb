class Owner::StudioPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # scope.where(user: record.studio.user)
      user.studios
    end
  end


end
