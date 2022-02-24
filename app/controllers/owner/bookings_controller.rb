class Owner::BookingsController < ApplicationController
  def index
    # @bookings = Booking.all
    @bookings = policy_scope([:owner, Booking])
    # render "bookings/index"
  end
end
