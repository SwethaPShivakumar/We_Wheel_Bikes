class BikesController < ApplicationController
  before_action :set_bike, only: %i[show edit update destroy]
  def index
    # Query db -> Get all bikes given location  long/lat

    if params[:bike] && params[:bike][:address].present?
      @address = params[:bike][:address]
      @bikes = Bike.near(@address, 500)
    else
      @address = ''
      @bikes = Bike.all
    end
    @bikes = @bikes.where(category: params[:category]) if params[:category]

    @markers = @bikes.geocoded.map do |bike|
      {
        lat: bike.latitude,
        lng: bike.longitude,
        info_window: render_to_string(partial: "info_window", locals: { bike: bike }),
        image_url: helpers.asset_url('https://source.unsplash.com/random')
        # add interpolation of bike img here
      }
    end
  end

  #
  # Renter
  #
  def show

    # Query db -> Get bike by ID

  end

  #
  # Biker owner
  #

  def new
    @bike = Bike.new
    # authorize if owner -> yes. else no
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user
    if @bike.save
      redirect_to @bike
    else
      render :new
    end
  end

  def edit
    # authorize if owner -> yes. else no
  end

  def update
    if @bike.update(bike_params)
      redirect_to @bike, notice: 'Bike was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    # authorize if owner -> yes. else no
    @bike.destroy
    redirect_to bikes_path
  end

  private

  def set_bike
    @bike = Bike.find(params[:id])
    
  end

  # Only allow a list of trusted parameters through.
  def bike_params
    params.require(:bike).permit(:name, :description, :price, :longtitude, :latitude, :photo)
  end
  # Use callbacks to share common setup or constraints between actions.
end
