class ContractSerializer < ActiveModel::Serializer
  attributes :id, :points

  belongs_to :team
  belongs_to :player
end
