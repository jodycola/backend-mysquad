class Player < ApplicationRecord
    has_many :teams
    has_many :teams, through: :contracts
end
