class ProfileController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]
    before_action :doorkeeper_authorize!
    def index
        #byebug
        @user = current_user
        @user ||= User.find(doorkeeper_token[:resource_owner_id]) if doorkeeper_token
        render json: @user
    end
        def update
    if @user.update(user_params)
        render json: @user
    else
        render json: @user.errors, status: :unprocessable_entity
    end
    end    
    # Only allow a trusted parameter "white list" through.
    private
    def set_user
        @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
        params.permit(:first_name, :last_name, :gender, :phone)
    end
 
end
