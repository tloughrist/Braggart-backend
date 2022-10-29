class Match < ActiveRecord::Base
    belongs_to :game
    has_many :player_matches
    hase_many :players, through: :player_matches
end