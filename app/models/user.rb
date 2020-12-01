class User < ApplicationRecord
    has_many :boards
    has_secure_password

    validates :name, :email, presence: true 
    validates :email, uniqueness: true
end
