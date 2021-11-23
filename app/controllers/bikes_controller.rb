class BikesController < ApplicationController
before_action :set_bike, only: %i[ show edit update destroy ]
  def index
    @bikes = policy_scope(Bike).where(category: params[:category])
  end

  def show
  end



  def new
    @bike = Bike.new
    authorize @bike
  end

  def create
    @bike = Bike.new(bike_params)
    authorize @bike
    @bike.user = current_user
    @bike.save
    redirect_to @bike
  end

  def edit
  end

  def update
     if @bike.update(bike_params)
      redirect_to @bike, notice: 'Bike was successfully updated.'
    else
      render :edit
    end

  end

  def destroy
    @bike.destroy
    redirect_to bikes_path
  end

  private

  def set_bike
    @bike = Bike.find(params[:id])
    authorize @bike
  end

  # Only allow a list of trusted parameters through.
  def bike_params
    params.require(:bike).permit(:name, :description, :price)
  end
  # Use callbacks to share common setup or constraints between actions.
  end
