class StatBlock < ActiveRecord::Base
    has_many :players
    has_many :player_matches, through: :players
    has_many :matches, through: :player_matches
    has_many :games, through: :matches

    ##Class methods: most wins by game, most wins over all, most/least points avg by game, most/lest points avg over all, player ranking by game, player ranking overall
end