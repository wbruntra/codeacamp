get '/' do
  @abuelita = params[:abuelita]

  erb :index
  # Visita app/views/index.erb
end


post '/abuelita' do
  user_input = params[:user_input]
  @abuelita = granny_respond(user_input)
  erb :granny_response, :layout => false
end
