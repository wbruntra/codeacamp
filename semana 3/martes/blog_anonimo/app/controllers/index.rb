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
  @post = Post.find_by_id(@id)
  erb :post
end

get '/delete' do
  @posts = Post.all

  erb :deleter
end

post '/delete' do
  post_ids = params[:unwanted]
  p post_ids.class
  s = 'You deleted:'
  a = Array.new
  post_ids.each do |post_id|
    post = Post.find_by_id(post_id)
    post.connections.destroy_all
    # connections = Connection.where(post_id: post_id)
    # connections.each do |connection|
    #   connection.delete
    # end
    a = a.push(post.title)
    post.delete
  end
  s + a.join(', ')
end

get '/tag/:name' do
  tagname = params[:name]
  @tag = Tag.find_by(name: tagname)
  @posts = @tag.posts

  erb :tag
end
