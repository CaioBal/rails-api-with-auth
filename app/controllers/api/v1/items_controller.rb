class Api::V1::ItemsController < ApplicationController

    before_action :authenticate_user!
    before_action :set_item, only: %i[show update destroy]

    def index
        @items = Item.by_user(current_user)
        render json: @items
    end

    def show
        render json: @item
    end

    def create
        @item = Item.new(valid_params)
        if @item.save
            render json: @item, status: 200
        else
            render json: @item.errors, status: :unprocessable_entity
        end
    end

    def update
        if @item
            @item.update(valid_params)
            render json: {message: "Updated"}, status: 200
        else
            render json: {error: "Not found"}, status: 500
        end
    end


    def destroy
        if @item
            @item.destroy
            render json: {message: "Deleted"}, status: 200
        else
            render json: {error: "Not found"}, status: 500
        end
    end

    def set_item
        @item = Item.by_user(current_user).find(params[:id])
        rescue ActiveRecord::RecordNotFound
            render json: {error: 'Not Found'}, status: 404
    end

    def valid_params
        params.require(:item).permit(:name, :description)
    end

end
