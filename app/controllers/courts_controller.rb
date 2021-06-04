class CourtsController < ApplicationController
  before_action :authenticate_user!, only: :new

  # rubocop:disable Metrics/MethodLength
  def index
    @courts = Court.all

    num = params[:price_range].to_f
    location = params[:location]
    surfaces = params[:surface_type]

    price_query = Court.where(price: 10..num)

    location_query = Court.where(address: location)

    surface_query = Court.where(surfaces: surfaces)

    @collect = price_query + location_query + surface_query
    @collect = @collect.uniq

    @collect = @courts if @collect.empty?

    @collect.map do |court|
      {
        lat: court.latitude,
        lng: court.longitude
      }
    end

    @markers = @collect.map do |court|
      {
        lat: court.latitude,
        lng: court.longitude,
        info_window: render_to_string(partial: "info_window", locals: { court: court })
      }
    end
  end
  # rubocop:enable Metrics/MethodLength

  def show
    @court = Court.find(params[:id])
    @booking = Booking.new
    @markers = [{ lat: @court.latitude, lng: @court.longitude }] # info_window: render_to_string(partial: "info_window", locals: { @court: court })}]
  end

  def new
    @court = Court.new
  end

  def create
    @court = Court.new(court_params)
    @court.user = current_user

    if @court.save!
      redirect_to courts_path
    else
      render :new
    end
  end

  private

  def court_params
    params.require(:court).permit(:user_id, :address, :title, :price, :description, :surfaces, :category, photos: [])
  end
end
