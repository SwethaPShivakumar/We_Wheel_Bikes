class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ destroy ]
  before_action :set_bike, only: %i[ new create ]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.bike = @bike
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  private

  
  def set_bike
    @bike = Bike.find(params[:bike_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:bike_id, :start_day, :finish_day)
  end

end
