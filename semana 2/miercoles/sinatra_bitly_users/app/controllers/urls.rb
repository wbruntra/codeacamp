get '/' do
  # Deja a los usuarios crear una URL reducida y despliega una lista de URLs.
  @urls = Url.all
  session['email'] ||= nil
  @user_urls = Url.where(creator: session['email'])
  erb :index
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

# e.g., /q6bda
get '/go/:short_url' do
  # redirige a la URL original
  u = params[:short_url]
  @url = Url.find_by(short_url: u)
  full_url = @url.long_url
  clicks = @url.click_count + 1
  @url.update(click_count: clicks)
  redirect full_url
end
