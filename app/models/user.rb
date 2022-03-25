class User < ApplicationRecord
    validates :name, uniqueness: true
    def points
        wins * 2 + draws
    end
end
