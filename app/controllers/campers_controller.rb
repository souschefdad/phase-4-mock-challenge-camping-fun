class CampersController < ApplicationController

    def index
        campers = Camper.all
        render json: campers, status: :ok
    end

    def show
        selected_camper = Camper.find_by(id:params[:id])

        if selected_camper
            render json: selected_camper, status: :ok
        else
            render json:
            { "error": "Camper not found" }, status: :not_found
        end
    
    end

    def create
        new_camper = Camper.create(camper_params)
        if new_camper
            render json: new_camper, status: :created
        else
            render json: 
            { "errors": ["validation errors"] }, status: :bad_request
        end
    end

private
    def camper_params
        params.permit(:name, :age)
    end

end
