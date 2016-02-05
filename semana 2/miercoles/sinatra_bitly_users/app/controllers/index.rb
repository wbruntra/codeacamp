get '/' do
  # Deja a los usuarios crear una URL reducida y despliega una lista de URLs.
  @urls = Url.all
  session['email'] ||= nil
  @user_urls = Url.where(creator: session['email'])
  erb :index
end

get '/debug' do
  @urls = Url.all
  @urls.each do |url|
    p url
  end
  erb :debug
end

post '/urls' do
  url = params[:url]
  short_url = Url.make_short
  creator = session['email']
  h = {
    'long_url' => url,
    'short_url' => short_url,
    'creator' => creator
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
