class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :index]
  def index
    @bookings = Booking.where(user_id: current_user)

  end

  def new
    @court = Court.find(params[:court_id])
    @booking = Booking.new
  end

  def create
    @court = Court.find(params[:court_id])
    @booking = Booking.new(booking_params)
    @booking.court = @court
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time)
  end
end
