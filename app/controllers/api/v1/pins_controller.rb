class Api::V1::PinsController < ApplicationController
    def index
        pins = Pin.all
        render json: PinSerializer.new(pins)
    end

    def create
        pin = Pin.new(pin_params)

        if pin.save
        render json: Pin.new(pin), status: :ok
    end 

    def destroy
        pin = Pin. find(params[:id])

        if pin && pin.destroy
        render : {data: "Pin successfully destroyed"}, status: :ok
    end

    private

    def pin_params
        params.require(:pin).permit(:name, :image_url, :user_id, :board_id )
    end

end

