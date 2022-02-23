class StudiosController < ApplicationController
  before_action :set_studio, only: [:show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # @studios = Studio.all
    @studios = policy_scope(Studio).geocoded
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
