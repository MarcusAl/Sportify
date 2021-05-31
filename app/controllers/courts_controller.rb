class CourtsController < ApplicationController
    def index
        @courts = Court.all
    end
    
    def new
        @court = Court.new
    end

    def create
        @court = Court.new(strong_params)
        if @court.save
            redirect_to courts_path
        else
            render :new
        end
    end
end
