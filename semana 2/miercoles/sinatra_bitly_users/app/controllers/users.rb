get '/signup' do
  erb :signup
end

post '/signup' do
  username = params[:username]
  email = params[:email]
  password = params[:password]
  h = {
    'username' => username,
    'email' => email,
    'password' => password
  }
  @user = User.new(h)
  if (@user.save)
    session['email'] = email
    redirect '/'
  end
end

get '/users/:id' do
  user = params[:id]
  if (session['email'] == user)
    erb :perfil
end
