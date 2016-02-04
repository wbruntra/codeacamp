before '/secret/*' do
  user = session['email']
  if (user)
    @authorized = true
  else
    @authorized = false
  end
end

get '/' do
  session['email'] ||= nil
  erb :index
end

get '/signup' do
  erb :signup
end

post '/signup' do
  email = params[:email]
  pw = params[:password]
  @user = User.create(email: email,password: pw)
  if @user.save
    session['email'] = email
    redirect '/secret/'
  end
end

get '/login' do
  erb :login
end

post '/login' do
  email = params[:email]
  pw = params[:password]
  @user = User.authenticate(email,pw)
  if (@user)
    session['email'] = @user.email
    redirect '/'
  else
    erb :login
  end
end

get '/logout' do
  session['email'] = nil
  redirect '/'
end

get '/secret/:username' do
  if (@authorized)
    erb :secret
  else
    redirect '/'
  end
end
