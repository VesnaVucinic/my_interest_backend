class Board < ApplicationRecord
    belongs_to :user
    has_many :pins

    validates :name, :user, :image_url, presence: true

    before_create :set_likes

    def set_likes
        self.likes = 0
    end
end
