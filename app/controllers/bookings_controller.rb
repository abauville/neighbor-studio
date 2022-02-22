class BookingsController < ApplicationController
  def index
    # @bookings = Booking.all
    @bookings = policy_scope(Booking)
  end

  def new
    # redirect_to new_user_session_path unless current_user
    @booking = Booking.new
    @studio = Studio.find(params[:studio_id])
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @studio = Studio.find(params[:studio_id])
    @booking.studio = @studio
    @booking.user = current_user
    if @booking.save
      redirect_to studio_path(@studio)
    else
      render :new
    end
  end

  def edit
    raise
  end

  def patch
    raise
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
