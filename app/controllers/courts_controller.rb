class CourtsController < ApplicationController
  
  before_action :authenticate_user!, only: :new
  def index
    @courts = Court.all
    @markers = @courts.geocoded.map do |court|
      {
        lat: court.latitude,
        lng: court.longitude,
        info_window: render_to_string(partial: "info_window", locals: { court: court })
      }
    end
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
