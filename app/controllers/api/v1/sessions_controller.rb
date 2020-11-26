class Api::V1::SessionsController < ApplicationController
    def create
      # byebug
        @user = User.find_by(email: params[:session][:email])
  
        if @user && @user.authenticate(params[:session][:password])
          token = generate_token({id: @user.id})
          render json: { user: UserSerializer.new(@user), jwt: token }, status: :ok
        else
          render json: {
            error: "Invalid Credentials"
          }
        end
    end

    def get_current_user
      # byebug
        if logged_in?
          render json: { user: UserSerializer.new(current_user) }, status: :ok
        else
          render json: {
            error: "No one logged in"
          }
        end
    end

    # def destroy
    #     session.clear
    #     render json: {
    #       notice: "Successfully logged out"
    #     }, status: :ok
    # end

end
