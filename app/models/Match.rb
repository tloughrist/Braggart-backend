class Match < ActiveRecord::Base
    belongs_to :game
    has_many :player_matches
    has_many :players, through: :player_matches
end