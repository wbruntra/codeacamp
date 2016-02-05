get '/' do
  # Deja a los usuarios crear una URL reducida y despliega una lista de URLs.
  erb :index
end

post '/urls' do
  url = params[:url]
  short_url = Url.make_short
  p short_url
  redirect '/'
end

# e.g., /q6bda
get '/:short_url' do
  # redirige a la URL original
end
