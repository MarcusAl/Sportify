class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(current_user == Booking.user_id)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to court_bookings_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :court_id, :date)
  end
end
