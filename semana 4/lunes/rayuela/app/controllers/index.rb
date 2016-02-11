get '/' do
  # La siguiente linea hace render de la vista
  # que esta en app/views/index.erb
  erb :index
end

get '/register' do
  erb :register
end

post '/register' do
  player1 = params[:player1]
  player2 = params[:player2]
  p1 = Player.find_by(name: player1)
  p2 = Player.find_by(name: player2)
  if !p1
    p1 = Player.create(name: player1)
  end
  if !p2
    p2 = Player.create(name: player2)
  end
  session[:player1] = player1
  session[:player2] = player2
  redirect '/play'
end

get '/play' do
  status = {}
  player1 = session[:player1]
  player2 = session[:player2]
  status['players'] = [player1, player2]
  @status = JSON.dump(status)

  erb :play
end

post '/result' do
  winner = params[:winner]
  players = params[:players].split(',')
  status = params[:status]
  game = Game.create(status: status)
  if winner
    win_player = Player.find_by(name: winner)
    new_wins = win_player.wins + 1
    win_player.update(wins: new_wins)
  end
  for player in players do
    active_player = Player.find_by(name: player)
    new_total = active_player.total + 1
    new_total = active_player.update(total: new_total)
  end
  (game.id).to_s
end

get '/game/:id' do
  game_id = params[:id]
  game = Game.find_by_id(game_id)
  @status = game.status

  erb :game
end

get '/profile/:player' do
  name = params[:player]
  @player = Player.find_by(name: name)

  erb :profile
end

get '/debug' do
  @games = Game.all

  erb :debug
end
