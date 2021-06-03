class CourtsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
      
 
    @courts = []
    courts2 = []
    Court.reindex
    location_results = Court.search(params[:location])
    location_count = location_results.total_count


     @markers = @courts.geocoded.map do |court|
      {
        lat: court.latitude,
        lng: court.longitude,
        info_window: render_to_string(partial: "info_window", locals: { court: court })
      }
    end

    
    # if location_count.positive?
    #   location_results.each do |location|
    #     price_check = location.price <= params[:price_range].to_f
    #     courts2 << location if price_check
    #     next if courts2.empty?
    #   end
    #   @courts = courts2
    # elsif params[:price_range] != ""
    #   num = params[:price_range].to_f
    #   sql_query = "price BETWEEN 0 AND #{num}"
    #   courts2 = Court.where(sql_query)
    #   @courts = courts2
    # else
    #   @courts = Court.all
    # end
  end

  def show
    @court = Court.find(params[:id])
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
