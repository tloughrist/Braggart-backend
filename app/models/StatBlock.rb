class StatBlock < ActiveRecord::Base
    belongs_to :player
    has_many :player_matches, through: :players
    has_many :matches, through: :player_matches
    belongs_to :game

    def self.statify(player, game)
        intersect_matches = player.player_matches.filter do |player_match|
            game.matches.ids.include? player_match.match_id
        end
        num_matches = intersect_matches.count
        winners = game.matches.map {|match| match.winner}
        wins = winners.count(player.name)
        played_matches = player.matches.filter {|match| match.game_id == game.id}
        
        points_off = player.matches.map do |match|
            if game.high_score_to_win
                #find high score player match
                high_score = match.player_matches.map {|player_match| player_match.points}.max
                puts high_score
                #subtract this player match score from high score
                player_score = match.player_matches.find_by(player_id: player.id).points
                high_score - player_score
            else
                #find low score player match
                lo_score = match.player_matches.map {|player_match| player_match.points}.min
                puts lo_score
                #subtract low score from this player match score
                player_score = match.player_matches.find_by(player_id: player.id).points
                player_score - lo_score
            end
        end
        
        avg_deviation = (points_off.sum.to_f / points_off.size.to_f).round(2)
        StatBlock.create(
            player_name: player.name,
            num_matches: num_matches,
            wins: wins,
            win_rate: wins == 0 ? 0 : (wins.to_f / num_matches.to_f).round(2),
            avg_deviation: avg_deviation,
            player_id: player.id,
            game_id: game.id
        )
    end

    def self.populate
        Player.all.each do |player|
            Game.all.each do |game|
                StatBlock.statify(player, game)
            end
        end
    end
end