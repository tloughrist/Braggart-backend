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

    def rank
        if self.game.high_score_to_win
            player_matches = self.player_matches.order("points DESC")
            ranking = {}
            if player_matches.size > 0
                player_matches.map do |player_match|
                    ranking[player_match.player.name] = player_match.points
                end
            end
            ranking
        else
            player_matches = self.player_matches.order("points ASC")
            ranking = {}
            if player_matches.size > 0
                player_matches.map do |player_match|
                    ranking[player_match.player.name] = player_match.points
                end
            end
            ranking
        end
    end

    def append
        {"game" => self.game.name, "winner" => self.winner, "players" => self.rank}
    end

    def delete_player_matches
        player_matches = PlayerMatch.all
        player_matches_filt = player_matches.filter {|player_match| player_match.match_id == self.id}
        player_matches_filt.map {|player_match| player_match.destroy}
    end

end