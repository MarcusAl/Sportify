class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user_id: current_user)
  end

  def new
    @court = Court.find(params[:court_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @court = Court.find(params[:court_id])
    @booking.court = @court
    @booking.user = current_user
    @booking.save!
    if @booking.save
      redirect_to court_bookings_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date)
  end
end
