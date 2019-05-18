class FranchisesController < ApplicationController
    def index

    end

    def show
        @franchise = Franchise.find_by_id(params[:id])
    end
    
    def new
        @franchise = Franchise.new
    end

    def create
        @franchise = Franchise.new(franchise_params)
        # binding.pry
        if !@franchise.valid?
            flash[:alert] = "Franchise info invalid"
            render :new
        else
            @franchise.save
            redirect_to franchise_path(@franchise)
        end
    end

    def edit
        @franchise = Franchise.find_by_id(params[:id])
    end

    def destroy

    end
    private

    def franchise_params
        params.require(:adventure).permit(:name, :company)
    end
end
