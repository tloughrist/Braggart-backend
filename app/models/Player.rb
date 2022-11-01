class Player < ActiveRecord::Base
    has_many :player_matches
    has_many :matches, through: :player_matches
    has_many :games, through: :matches

    def fav_game
        game_ids = self.player_matches.map {|player_match| player_match.match.game_id}
        fav_id = game_ids.max {|i| game_ids.count(i)}
        fav_game = self.games.find(fav_id)
        fav_game.name
    end

    def last_game
        matches_ordered = self.matches.order("match_date DESC")
        matches_ordered.first.game.name
    end

    def last_played
        matches_ordered = self.matches.order("match_date DESC")
        matches_ordered.first.match_date
    end

    def total_matches
        self.player_matches.count
    end

    def append
        append = []
        append << self.fav_game
        append << self.last_game
        append << self.last_played
        append << self.total_matches
        append
    end
end