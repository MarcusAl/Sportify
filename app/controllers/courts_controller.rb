class CourtsController < ApplicationController
    def index
        @courts = Court.all
    end
    
    def new
        @court = Court.new
    end

    def create
        @court = Court.new(court_params)
        @court.save
        if @court.save
            redirect_to courts_path
        else
            render :new
        end
    end

    private
    def court_params
        params.require(:court).permit(:user_id, :address, :price, :photo)
    end
end
