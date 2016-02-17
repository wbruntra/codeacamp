get '/' do
  # La siguiente linea hace render de la vista
  # que esta en app/views/index.erb
  erb :index
end

post '/comment' do
  author = params[:author]
  body = params[:body]

  erb :_comment, :layout => false, locals: {:author => author, :body => body}
end
