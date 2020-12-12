class Api::V1::BoardsController < ApplicationController
 
  def index
        # byebug
        if logged_in?
            @boards = current_user.boards
            render json:  BoardSerializer.new(@boards), status: :ok 
        else 
            @boards = Boards.all
            render json: BoardSerializer.new(@boards), status: :ok 
            # render json: {
            #     error: "You must be logged in to see boards"
            # }
        end
    end

    # def index
    #   # byebug
    #     @boards = Board.all
    #     render json: BoardSerializer.new(@boards) 
    # end

  #   def index 
  #     if  params[:user_id]
  #         @user = User.find_by_id(params[:user_id])
  #         @boards = @user.boards 
  #         render json:  BoardSerializer.new(boards), status: :ok 
  #     else
  #     #if it's not nested: /reviews
  #         @boards = Boards.all
  #         render json:  BoardSerializer.new(boards), status: :ok
  #     end
  # end


    def create
      # byebug
        @board = current_user.boards.build(board_params)
    
        if @board.save
          render json:  BoardSerializer.new(@board), status: :created
        else
          error_resp = {
            error: @board.errors.full_messages.to_sentence
          }
          render json: error_resp, status: :unprocessable_entity
        end
      end

      private

      def set_user
        @user = User.find(params[:user_id])
      end

      def board_params
        params.require(:board).permit(:name, :image_url, :user_id, :id)
      end
end
