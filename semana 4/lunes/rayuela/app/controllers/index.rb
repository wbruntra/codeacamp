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
  p player1
  p player2
  session[:player1] = player1
  session[:player2] = player2
  redirect '/play'
end

get '/play' do
  @player1 = session[:player1]
  @player2 = session[:player2]

  erb :play
end

post '/result' do
  winner = params[:winner]
  players = params[:players].split(',')
  p winner
  p players
  'OK'
end
