get '/profile/:username' do
  username = params[:username]
  @user = User.find_by(username: username)
  user_id = @user.id
  @questions = @user.questions

  erb :profile
end

get '/register' do

  erb :register
end

post '/register' do
  fullname = params[:fullname]
  email = params[:email]
  username = params[:username]
  password = params[:password]
  user = User.find_by(username: username)
  if user
    return "Name already taken"
  end
  user_info = {
    'fullname' => fullname,
    'email' => email,
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
  session['user_id'] = nil
  redirect '/'
end
