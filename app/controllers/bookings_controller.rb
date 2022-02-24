class BookingsController < ApplicationController
  def index
    # @bookings = Booking.all
    @bookings = policy_scope(Booking)
  end

  def new
    # redirect_to new_user_session_path unless current_user
    @studio = Studio.find(params[:studio_id])
    @booking = Booking.new(studio: @studio)
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @studio = Studio.find(params[:studio_id])
    @booking.studio = @studio
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to bookings_path
    else
      render "studios/show"
    end
  end

  def edit
    raise
  end

  def patch
    raise
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.accepted!
    render :index
  end

  def refuse
    @booking = Booking.find(params[:id])
    @booking.refused!
    render :index
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
