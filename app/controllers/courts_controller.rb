class CourtsController < ApplicationController
    before_action :authenticate_user!, only: :new
    def index
      @courts = []
      if params[:location] || params[:price_range]
        # if params[:location]
        #   sql_query = "address ILIKE :location"
        #   @courts += Court.where(sql_query, location: "%#{params[:location]}%")
        # end
        if params[:price_range]
          num = params[:price_range].to_f
          sql_query = "price BETWEEN 0 AND #{num}"
          @courts += Court.where(sql_query)
        end
      else
        @courts = Court.all
      end
    end

    def show
        @court = Court.find(params[:id])
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
        params.require(:court).permit(:user_id, :address, :price, :description, :surfaces, :category, photos: [])

    end
  end
