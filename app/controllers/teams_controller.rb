class TeamsController < ApplicationController

    def index
        teams = Team.all
        render json: teams
    end

    def show
        teams = Team.where(user_id: params[:user_id])
        render json: teams
    end

    def delete
        team = Team.destroy(params[:team_id])
        render json: team
    end

    def create
        Team.create(team_name: params[:create][:team_name], salary: 100000, user_id:  params[:user_id])
        teams = Team.where(user_id: params[:user_id])
        render json: teams
    end

    def roster
        team = Team.find(params[:team_id])
        render json: team
    end

    def remove_from_team
        player = Team.find(params[:team_id]).contracts.find_by(player_id: params[:player_id]).destroy
        render json: player
    end

    def point_total
        total = 0

        team = Team.find(params[:team_id])
        team.contracts.each do |player|
            total += player.points
        end



        team.update(points: total)
        render json: team
    end

end
