class ContractSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :team
  belongs_to :player
end
