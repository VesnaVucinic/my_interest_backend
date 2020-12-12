class Board < ApplicationRecord
    belongs_to :user
    has_many :pins

    validates :name, :user, :image_url, presence: true
end
