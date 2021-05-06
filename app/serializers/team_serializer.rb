class TeamSerializer < ActiveModel::Serializer
  attributes :id, :team_name, :salary, :points, :user_id, :contracts
end
