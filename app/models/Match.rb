class Match < ActiveRecord::Base
    belongs_to :game
    has_many :player_matches
end