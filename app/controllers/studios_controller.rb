class StudiosController < ApplicationController
  before_action :set_studio, only: [:show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # @studios = Studio.all
    @studios = policy_scope(Studio)
  end

  def show
  #   @studio = Studio.find(params[:id])
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
<<<<<<< HEAD
<<<<<<< HEAD
=======
=======

>>>>>>> 78bec99445df15a42443d79b317e8f9326e019b2
  def set_studio
    @studio = Studio.find(params[:id])
    authorize @studio
  end
<<<<<<< HEAD
>>>>>>> f92a271447e1bee5860f808b2129f6798a1abd11
=======
>>>>>>> 78bec99445df15a42443d79b317e8f9326e019b2

  def studio_params
    # params[:studio][:user] = current_user
    params.require(:studio).permit(:name, :address, :description, :price, :photo, :user)
  end
end
