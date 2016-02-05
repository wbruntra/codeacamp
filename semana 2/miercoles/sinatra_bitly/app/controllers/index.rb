get '/' do
  # Deja a los usuarios crear una URL reducida y despliega una lista de URLs.
  @urls = Url.all
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
  p short_url
  h = {
    'long_url' => url,
    'short_url' => short_url
  }
  @url = Url.new(h)
  if (@url.save)
    redirect '/'
  else
    "That URL was not very good"
  end
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
