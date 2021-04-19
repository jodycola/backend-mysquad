class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :plays_for_team, :position, :contracts

end
