class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get '/games' do
    games = Game.order(:name)
    games.to_json({:methods => :append})
  end

  get '/players' do
    players = Player.order(:name)
    players.to_json({:methods => :append})
  end

  get '/matches' do
    matches = Match.order("match_date DESC")
    matches.to_json({:methods => :append})
  end

  get '/player_matches' do
    pmatches = PlayerMatch.order("match_id ASC")
    pmatches.to_json
  end

  get '/stat_blocks' do
    StatBlock.destroy_all
    StatBlock.populate
    stat_blocks = StatBlock.all
    stat_blocks.to_json({:include => :game})
  end

  post '/games' do
    game = Game.create(
      name: params[:name],
      high_score_to_win: params[:high_score_to_win]
    )
    game.to_json
  end

  post '/matches' do
    match = Match.create(
      match_date: params[:match_date],
      game_id: params[:game_id]
    )
    match.to_json
  end
  
  post '/player_matches' do
    player_match = PlayerMatch.create(
      match_id: params[:match_id],
      player_id: params[:player_id],
      points: params[:points]
    )
    player_match.to_json
  end

  post '/players' do
    player = Player.create(
      name: params[:name],
    )
    player.to_json
  end

  patch '/games/:id' do
    game = Game.find(params[:id])
    game.update(
      name: params[:name],
      high_score_to_win: params[:high_score_to_win]
    )
    game.to_json
  end

  patch '/players/:id' do
    player = Player.find(params[:id])
    player.update(
      name: params[:name]
    )
    player.to_json
  end

  patch '/matches/:id' do
    match = Match.find(params[:id])
    match.update(
      match_date: params[:match_date],
      game_id: params[:game_id]
    )
    match.delete_player_matches
    match.to_json
  end

  delete '/games/:id' do
    game = Game.find(params[:id])
    game.delete_matches
    game.destroy
    game.to_json
  end

  delete '/matches/:id' do
    match = Match.find(params[:id])
    match.delete_player_matches
    match.destroy
    match.to_json
  end

  delete '/player_matches/:id' do
    player_match = PlayerMatch.find(params[:id])
    player_match.destroy
    player_match.to_json
  end

  delete '/players/:id' do
    player = Player.find(params[:id])
    player.delete_player_matches
    player.destroy
    player.to_json
  end

end
