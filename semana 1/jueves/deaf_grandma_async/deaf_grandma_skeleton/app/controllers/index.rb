get '/' do
  @abuelita = params[:abuelita]
  
  erb :index
  # Visita app/views/index.erb
end


post '/abuelita' do
  user_input = params[:user_input]
  granny_response = granny_respond(user_input)
  redirect to('/?abuelita='+granny_response)
end
