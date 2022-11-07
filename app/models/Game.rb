class Game < ActiveRecord::Base
    has_many :matches
    has_many :player_matches, through: :matches
    has_many :players, through: :player_matches
    has_many :stat_blocks

    def last_match
        if self.matches.size > 0
            self.matches.order("match_date DESC").first.match_date
        else
            "No match data"
        end
    end

    def no_of_matches
        if self.matches.size > 0
            self.matches.count
        else
            "0"
        end
    end

    def most_winning
        if self.matches.size > 0
            winners = self.matches.map {|match| match.winner}
            no_dupes = winners.uniq
            winner_count = no_dupes.map do |winner|
                winners.count(winner)
            end
            most_wins = no_dupes.filter {|winner| winners.count(winner) == winner_count.max}
        else
            ["No match data"]
        end
    end

    def append
        {"last_match" => self.last_match, "no_of_matches" => self.no_of_matches, "most_wins" => self.most_winning}
    end

    def delete_matches
        matches = self.matches
        matches.map do |match|
            match.delete_player_matches
            match.destroy
        end
    end
end