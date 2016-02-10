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
