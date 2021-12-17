class SignupsController < ApplicationController

    def create
        new_signup = Signup.create(signup_params)

        if new_signup
            render json: new_signup, status: :created
        else
            render json: { "errors": ["validation errors"] }, status: :bad_request
        end
    end

private

def signup_params
    params.permit(:time, :camper_id, :activity_id)
end

end
