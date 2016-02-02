get '/' do
  erb :index
end

get '/:new_word' do
	@new_word = params[:new_word]

  erb :word
end

post '/new_word' do
  redirect to ("/#{params[:user_word]}")
end