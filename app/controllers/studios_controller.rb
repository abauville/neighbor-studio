class StudiosController < ApplicationController
  before_action :set_studio, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # @studios = Studio.all

    @studios = policy_scope(Studio).geocoded
    @title = "All our studios"
    @search_msg = ""
    @distance_value = params[:distance] || "" # used to autofill the form
    @address_value = params[:address] || ""
    if params[:address]
      params[:distance] = params[:distance].empty? ? 2 : params[:distance]
      studios_found = @studios.near(params[:address], params[:distance])
      if studios_found.empty?
        @search_msg = "We couldn't find studios within #{params[:distance]} km of #{params[:address]}"
      else
        @studios = studios_found
        @title = "Studios within #{params[:distance]} km of #{params[:address]}"
      end
    end
    @markers = @studios.map do |studio| #@studios.geocoded.map do |studio|
      {
        lat: studio.latitude,
        lng: studio.longitude,
        info_window: render_to_string(partial: "info_window", locals: { studio: studio }),
        marker_html: render_to_string(partial: "marker", locals: { studio: studio })
      }
    end
  end

  def show
    @booking = Booking.new(start_date: Date.today) # new booking for the form
    @markers = [{ lat: @studio.latitude, lng: @studio.longitude }]
  end

  def new
    @studio = Studio.new
    authorize @studio
  end

  def create
    @studio = Studio.new(studio_params)
    @studio.user = current_user
    authorize @studio
    if @studio.save
      redirect_to "/studios/#{@studio.id}"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @studio.update(studio_params)
      redirect_to owner_studios_path(studio_params)
    else
      render :edit
    end
  end

  private

  def set_studio
    @studio = Studio.find(params[:id])
    authorize @studio
  end

  def studio_params
    # params[:studio][:user] = current_user
    params.require(:studio).permit(:name, :address, :description, :price, :photo, :user)
  end
end
