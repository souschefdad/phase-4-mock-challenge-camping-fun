class ActivitiesController < ApplicationController

    def index
        activities = Activity.all
        render json: activities, status: :ok
    end
    
    def destroy
        destroyed_activity = Activity.find_by(id:params[:id]).destroy
        
        if destroyed_activity
            render json: destroyed_activity, status: :no_content
        else
            render json: { "error": "Activity not found" }, status: :not_found
        end

    end

end
