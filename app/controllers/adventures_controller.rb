require 'pry'
class AdventuresController < ApplicationController
    
    def index

    end
    
    def new
        # binding.pry
        @franchise = Franchise.find_by_id(params[:franchise_id])
        @adventure = Adventure.new
    end

    def create
        # binding.pry
        @adventure = Adventure.new(adventure_params)
        @adventure.name = params[:adventure][:name]
        @adventure.location = params[:adventure][:location]
        @adventure.franchise_id = params[:adventure][:franchise_id]
        @adventure.villain_id = params[:adventure][:villain_id]
    #Need to validate against invalid data!
        @adventure.save
    end

    def show
        @adventure = Adventure.find_by_id(params[:id])
    end

    def edit
        @adventure = Adventure.find_by_id(params[:id])
    end

    def destroy

    end

    private

    def adventure_params
        params.require(:adventure).permit(:name, :location, :franchise_id, :user_id, :villain_id)
    end
end
