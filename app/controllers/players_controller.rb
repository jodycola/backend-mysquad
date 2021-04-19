class PlayersController < ApplicationController

    def index
        all = Player.all
        render json: all
    end

    def show
        if params[:filter] == "All"
            search = Player.where("first_name LIKE ?", "#{params[:search]}%".titleize()) | Player.where("last_name LIKE ?", "#{params[:search]}%".titleize()) |
            Player.where("concat_ws(' ', first_name, last_name) LIKE ?", "%#{params[:search]}%".titleize())
            search = search.sort_by { |a| [ a.last_name, a.first_name ] }
            render json: search
        else
            team_filter = Player.where(plays_for_team: params[:filter])
            search = team_filter.where("first_name LIKE ?", "#{params[:search]}%".titleize()) | team_filter.where("last_name LIKE ?", "#{params[:search]}%".titleize()) |
            team_filter.where("concat_ws(' ', first_name, last_name) LIKE ?", "%#{params[:search]}%".titleize())
            search = search.sort_by { |a| [ a.last_name, a.first_name ] }
            render json: search
        end
    end

    def filter
        filter = Player.where(plays_for_team: params[:filter])
        render json: filter
    end

end
