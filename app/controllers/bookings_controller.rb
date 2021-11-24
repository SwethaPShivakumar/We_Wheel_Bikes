class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ destroy ]
  before_action :set_bike, only: %i[ show update  ]

  
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.bike = @bike
    if @booking.save
      redirect_to bike_path(@bike)
    else
      render :new
    end
  end

  def destroy
  end

  private

  
  def set_bike
    @bike = Bike.find(params[:bike_id])
  end

  def set_booking
    @bike = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:bike_id, :start_day, :finish_day)
  end

end
