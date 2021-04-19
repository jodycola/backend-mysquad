class ContractsController < ApplicationController

    def find
        player = Contract.find_by(player_id: params[:player_id]).player
        render json: player
    end

    def create
        if Team.find(params[:team_id]).contracts.length < 5
            contract = Contract.create(team_id: params[:team_id], player_id: params[:player_id])
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

end
