class Team < ApplicationRecord
    belongs_to :user
    has_many :contracts
    accepts_nested_attributes_for :contracts
end
