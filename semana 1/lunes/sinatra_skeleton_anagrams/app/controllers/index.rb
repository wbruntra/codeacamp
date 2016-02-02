get '/' do
  erb :index
end

get '/model' do
  erb :my_model
end

get '/list' do
  @models = Model.all
  erb :model_list
end

post '/submit' do
	@model = Model.new(params[:model])
	if @model.save
		redirect '/list'
	else
		"Sorry, there was an error!"
	end
end

get '/:new_word' do
	@new_word = params[:new_word]
  canon = get_canonical(@new_word)
  @words = Word.where(canonical:canon)
  erb :word
end

post '/new_word' do
  redirect to ("/#{params[:user_word]}")
end
