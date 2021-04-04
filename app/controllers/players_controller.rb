class PlayersController < ApplicationController

    def index
        all = Player.all
        render json: all
    end

    def show
        search = Player.where(first_name: params[:search].capitalize()) | Player.where(last_name: params[:search].capitalize())

        render json: search
    end
end
