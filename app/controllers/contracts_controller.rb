class ContractsController < ApplicationController

    def find
        player = Contract.find_by(player_id: params[:player_id]).player
        render json: player
    end

    def create
        team = Team.find(params[:team_id]).contracts
        if team.length < 5
            team.each do |player| 
                if player.player_id == params[:player_id]
                   return render json: { errors: ['Can\'t add the same player more than once'] }, status: :unprocessable_entity
                end
            end
            signed = Contract.create(team_id: params[:team_id], player_id: params[:player_id])
            contract = Contract.find(signed.id)
            render json: contract
        else
            render json: { errors: ['Max player limit reached'] }, status: :unprocessable_entity
        end
    end

    def delete
        removed_contract = Contract.find_by(player_id: params[:player_id])
        removed_contract.destroy
        render json: removed_contract
    end

    def get_points
        update_contract = Contract.find_by(player_id: params[:player_id])
        update_contract.update(points: params[:points])
        render json: update_contract
    end

end
