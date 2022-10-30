class Game < ActiveRecord::Base
    has_many :matches
    has_many :player_matches, through: :matches
    has_many :players, through: :player_matches
end