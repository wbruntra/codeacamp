get '/' do
  # La siguiente linea hace render de la vista
  # que esta en app/views/index.erb
  @posts = Post.all

  erb :index
end

get '/new' do
  erb :newpost
end

post '/new' do
  title = params[:title]
  author = params[:author]
  body = params[:body]
  tags = params[:tags].split(',')
  tags =  tags.collect{|x| x.strip || x }
  add_post(title,author,body,tags)

  redirect '/'
end

get '/post/:id' do
  @id = params[:id]
  @post = Post.find(@id)
  erb :post
end

get '/tag/:name' do
  tagname = params[:name]
  @tag = Tag.find_by(name: tagname)
  @posts = @tag.posts

  erb :tag
end
