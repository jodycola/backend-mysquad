class TeamSerializer < ActiveModel::Serializer
  attributes :id, :team_name, :salary, :user_id, :contracts
end
