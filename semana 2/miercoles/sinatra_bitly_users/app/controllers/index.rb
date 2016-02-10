before do
  pass if ['signup', 'login','logout','debug', nil].include? request.path_info.split('/')[1]
  if !session['email']
    redirect '/login'
  end
end

get '/' do
  # Deja a los usuarios crear una URL reducida y despliega una lista de URLs.
  @urls = Url.all
  session['email'] ||= nil
  if session['email']
    @user = User.where(email: session['email']).first
  end
  erb :index
end

get '/users/:id' do
  id = params[:id]
  @user = User.where(username: id).first
  @user_urls = Url.where(creator: @user.email)
  erb :profile
end

get '/debug' do
  @urls = Url.all
  @users = User.all
  erb :debug
end

post '/urls' do
  url = params[:url]
  if params[:private] == 'yes'
    personal = true
  else
    personal = false
  end
  short_url = Url.make_short
  creator = session['email']
  if !creator
    creator = 'Anonymous'
  end
  h = {
    'long_url' => url,
    'short_url' => short_url,
    'creator' => creator,
    'private' => personal
  }
  @url = Url.new(h)
  if (@url.save)
    redirect '/'
  else
    "That URL was not very good"
  end
end

get '/signup' do
  erb :signup
end

post '/signup' do
  email = params[:email]
  pw = params[:password]
  h = {
    'email' => email,
    'password' => pw
  }
  @user = User.new(h)
  if (@user.save)
    session['email'] = email
    redirect '/'
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

# e.g., /q6bda
get '/:short_url' do
  # redirige a la URL original
  u = params[:short_url]
  @url = Url.find_by(short_url: u)
  full_url = @url.long_url
  clicks = @url.click_count + 1
  @url.update(click_count: clicks)
  redirect full_url
end
