class User < ApplicationRecord
    has_many :teams
    accepts_nested_attributes_for :teams

    has_secure_password

    validates :email, presence: true, confirmation: true
    validates :name, presence: true
end
