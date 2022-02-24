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
    update_date_params(params)
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
    authorize @booking = Booking.find(params[:id])
    @booking.accepted!
    redirect_to owner_bookings_path
  end

  def refuse
    authorize @booking = Booking.find(params[:id])
    @booking.refused!
    redirect_to owner_bookings_path
  end

  private

  def update_date_params(params)
    date = params[:booking][:start_date]
    params[:booking][:start_date] = "#{date}T#{format('%02d', params[:start_time])}:00"
    params[:booking][:end_date] = "#{date}T#{format('%02d', params[:end_time])}:00"
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
