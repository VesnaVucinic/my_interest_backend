class Api::V1::BoardsController < ApplicationController
    def index
        boards = Board.all
        render json: BoardSerializer.new(boards)
    end

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


end
