class CourtsController < ApplicationController
    def index
        @courts = Court.all
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
