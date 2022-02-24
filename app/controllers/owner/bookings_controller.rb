class Owner::BookingsController < ApplicationController
  def index
    # @bookings = Booking.all
    bookings = policy_scope([:owner, Booking])
    ## returns array of hash with keys studio_name and studio_bookings filtered by status
    @bookings = bookings.map(&:studio).uniq.map do |studio|
      { studio_name: studio.name, studio_bookings: studio.bookings }
    end
    @pending_bookings = bookings.map(&:studio).uniq.map do |studio|
      { studio_name: studio.name, studio_bookings: studio.bookings.pending }
    end
    @accepted_bookings = bookings.map(&:studio).uniq.map do |studio|
      { studio_name: studio.name, studio_bookings: studio.bookings.accepted }
    end
    @refused_bookings = bookings.map(&:studio).uniq.map do |studio|
      { studio_name: studio.name, studio_bookings: studio.bookings.refused }
    end
    raise
  end
end
