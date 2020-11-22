class Api::V1::UsersController < ApplicationController
    def index
        users = User.all
        render json: UserSerializer.new(users)
    end
   
    def create
        @user = User.new(user_params)
    
        if @user.save
          session[:user_id] = @user.id
          render json: UserSerializer.new(@user), status: :created
        else
          resp = {
            error: @user.errors.full_messages.to_sentence
          }
          render json: resp, status: :unprocessable_entity
        end
    end

    def user_params
        params.require(:user).permit(:name, :email, :password, :id)
    end
end
