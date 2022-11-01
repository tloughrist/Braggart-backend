class Match < ActiveRecord::Base
    belongs_to :game
    has_many :player_matches
    has_many :players, through: :player_matches

    def winner
        if self.game.high_score_to_win
            max = self.player_matches.maximum(:points)
            win = self.player_matches.find_by(points: max)
            winner = self.players.find(win.player_id)
            winner.name
        else
            min = self.player_matches.minimum(:points)
            win = self.player_matches.find_by(points: min)
            winner = self.players.find(win.player_id)
            winner.name
        end
    end

    def ranking
        if self.game.high_score_to_win
            player_matches = self.player_matches.order("points DESC")
            ranking = player_matches.map {|player_match| self.players.find(player_match.player_id).name}
        else
            player_matches = self.player_matches.order("points ASC")
            ranking = player_matches.map {|player_match| self.players.find(player_match.player_id).name}
        end
    end

    def append
        {"game" => self.game.name, "winner" => self.winner, "players" => self.players.map {|player| player.name}}
    end

end