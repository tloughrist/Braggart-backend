puts "🌱 Seeding spices..."

Player.create(name: "Tim Loughrist")
Player.create(name: "Katie Loughrist")
Player.create(name: "Barb Loughlin")
Player.create(name: "Garrett Loughlin")
Player.create(name: "James Mitchell")
Player.create(name: "Jess Mitchell")

Game.create(name: "Train Dominos", high_score_to_win: false)
Game.create(name: "Settlers of Catan", high_score_to_win: true)
Game.create(name: "Carcassonne", high_score_to_win: true)
Game.create(name: "Rummikub", high_score_to_win: false)

Match.create(match_date: "2018-10-19", game_id:1)
Match.create(match_date: "2018-11-14", game_id:1)
Match.create(match_date: "2018-11-22", game_id:1)
Match.create(match_date: "2019-08-07", game_id:2)
Match.create(match_date: "2019-09-23", game_id:2)
Match.create(match_date: "2019-11-02", game_id:2)
Match.create(match_date: "2020-02-03", game_id:3)
Match.create(match_date: "2020-04-01", game_id:3)
Match.create(match_date: "2020-10-21", game_id:3)
Match.create(match_date: "2021-01-18", game_id:4)
Match.create(match_date: "2021-02-19", game_id:4)
Match.create(match_date: "2021-09-04", game_id:4)

PlayerMatch.create(match_id: 1, player_id: 1, points: 201)
PlayerMatch.create(match_id: 1, player_id: 2, points: 187)
PlayerMatch.create(match_id: 1, player_id: 3, points: 153)
PlayerMatch.create(match_id: 1, player_id: 4, points: 152)
PlayerMatch.create(match_id: 2, player_id: 2, points: 326)
PlayerMatch.create(match_id: 2, player_id: 3, points: 187)
PlayerMatch.create(match_id: 2, player_id: 4, points: 234)
PlayerMatch.create(match_id: 2, player_id: 5, points: 278)
PlayerMatch.create(match_id: 3, player_id: 3, points: 165)
PlayerMatch.create(match_id: 3, player_id: 4, points: 198)
PlayerMatch.create(match_id: 3, player_id: 5, points: 224)
PlayerMatch.create(match_id: 3, player_id: 6, points: 135)
PlayerMatch.create(match_id: 4, player_id: 1, points: 10)
PlayerMatch.create(match_id: 4, player_id: 3, points: 4)
PlayerMatch.create(match_id: 4, player_id: 4, points: 8)
PlayerMatch.create(match_id: 4, player_id: 6, points: 7)
PlayerMatch.create(match_id: 5, player_id: 2, points: 8)
PlayerMatch.create(match_id: 5, player_id: 3, points: 10)
PlayerMatch.create(match_id: 5, player_id: 4, points: 9)
PlayerMatch.create(match_id: 5, player_id: 5, points: 9)
PlayerMatch.create(match_id: 6, player_id: 1, points: 10)
PlayerMatch.create(match_id: 6, player_id: 2, points: 5)
PlayerMatch.create(match_id: 6, player_id: 3, points: 7)
PlayerMatch.create(match_id: 6, player_id: 5, points: 7)
PlayerMatch.create(match_id: 7, player_id: 3, points: 155)
PlayerMatch.create(match_id: 7, player_id: 4, points: 143)
PlayerMatch.create(match_id: 7, player_id: 5, points: 153)
PlayerMatch.create(match_id: 7, player_id: 6, points: 128)
PlayerMatch.create(match_id: 8, player_id: 1, points: 160)
PlayerMatch.create(match_id: 8, player_id: 2, points: 122)
PlayerMatch.create(match_id: 8, player_id: 3, points: 135)
PlayerMatch.create(match_id: 8, player_id: 5, points: 142)
PlayerMatch.create(match_id: 9, player_id: 1, points: 154)
PlayerMatch.create(match_id: 9, player_id: 4, points: 152)
PlayerMatch.create(match_id: 9, player_id: 5, points: 145)
PlayerMatch.create(match_id: 9, player_id: 6, points: 123)
PlayerMatch.create(match_id: 10, player_id: 2, points: 282)
PlayerMatch.create(match_id: 10, player_id: 4, points: 198)
PlayerMatch.create(match_id: 10, player_id: 5, points: 193)
PlayerMatch.create(match_id: 10, player_id: 6, points: 245)
PlayerMatch.create(match_id: 11, player_id: 1, points: 187)
PlayerMatch.create(match_id: 11, player_id: 3, points: 176)
PlayerMatch.create(match_id: 11, player_id: 5, points: 162)
PlayerMatch.create(match_id: 11, player_id: 6, points: 239)
PlayerMatch.create(match_id: 12, player_id: 2, points: 154)
PlayerMatch.create(match_id: 12, player_id: 3, points: 223)
PlayerMatch.create(match_id: 12, player_id: 4, points: 176)
PlayerMatch.create(match_id: 12, player_id: 5, points: 205)

StatBlock.create()

puts "✅ Done seeding!"