class Player < ActiveRecord::Base
    has_many :player_matches
    has_many :matches, through: :player_matches
    has_many :games, through: :matches

    def fav_game
        game_ids = self.player_matches.map {|player_match| player_match.match.game_id}
        no_dupes = game_ids.uniq
        game_count = no_dupes.map do |id|
            game_ids.count(id)
        end
        fav_ids = no_dupes.filter {|id| game_ids.count(id) == game_count.max}
        fav_games = fav_ids.map {|id| self.games.find(id).name}
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
        {"fav_game" => self.fav_game, "last_game" => self.last_game, "last_played" => self.last_played, "total_matches" => self.total_matches
        }
    end
end