class Player < ActiveRecord::Base
    has_many :player_matches
    has_many :matches, through: :player_matches
    has_many :games, through: :matches
end