class CourtsController < ApplicationController
  before_action :authenticate_user!, only: :new

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

    @markers = @courts.geocoded.map do |court|
      {
        lat: court.latitude,
        lng: court.longitude,
        info_window: render_to_string(partial: "info_window", locals: { court: court })
      }
    end
    
    # collect = @courts.select do |court|
    #   court[:price].between?(10, num) && court[:address] == location && court[:surfaces] == surfaces
    # end
    
    # query = Court.where(price: 10..num, address: location, surfaces: surfaces)

    # unless query.empty?
    #   query.each { |v| arr << v }
    #   @courts += arr
    # end

    # arr = []
    # Court.reindex
    # price_type = Court.search(where: { price: 1..num })
    # surface_type = Court.search(where: { surfaces: surfaces })
    # location_type = Court.search(where: { address: location })

    # price_type.each { |v| arr << v } unless price_type.total_count.zero?
    # surface_type.each { |f| arr << f } unless surface_type.total_count.zero?
    # location_type.each { |g| arr << g } unless location_type.total_count.zero?

    # if arr.empty?
    #   @courts = Court.all
    # else
    #   @courts = arr
    # end
  end

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
