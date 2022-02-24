class Owner::StudiosController < ApplicationController
  def index
    # @bookings = Booking.all
    @studios = policy_scope([:owner, Studio])
    # render "studios/index"
  end
end
