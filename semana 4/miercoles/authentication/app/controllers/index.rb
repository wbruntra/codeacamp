get '/' do
  # La siguiente linea hace render de la vista
  # que esta en app/views/index.erb
  erb :index
end

get '/register' do

  erb :register
end

post '/register' do
  username = params[:username]
  password = params[:password]
  user = User.find_by(username: username)
  if user
    return "Name already taken"
  end
  user_info = {
    'username' => username,
    'password' => password
  }
  user = User.create(user_info)
  if !user
    return "Something went wrong"
  end
  session['user_id'] = user.id
  redirect '/'
end

get '/signin' do

  erb :signin
end

post '/signin' do
  username = params[:username]
  password = params[:password]
  user = User.find_by(username: username)
  if !user
    return "No user by that name"
  end
  user = User.authenticate(username,password)
  if !user
    return "Bad password"
  end
  session['user_id'] = user.id
  redirect '/'
end

get '/signout' do
  session['user'] = nil
  redirect '/'
end

get '/debug' do
  @users = User.all

  erb :debug
end
