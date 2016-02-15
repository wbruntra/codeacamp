before do
  pass if ['register', 'signin','signout','debug', nil].include? request.path_info.split('/')[1]
  if !session['user_id']
    redirect '/signin'
  end
end

get '/' do
  @questions = Question.all
  @user = User.find_by_id(session['user_id'])

  erb :index
end

get '/ask' do
  @user = User.find_by_id(session['user_id'])

  erb :ask
end

post '/ask' do
  user_id = session['user_id']
  user = User.find_by_id(user_id)
  title = params[:title]
  body = params[:body]
  question_info = {
    'user_id' => user_id,
    'title' => title
  }
  if body
    question_info['body'] = body
  end
  question = Question.create(question_info)

  redirect '/'
end

get '/question/:id' do
  question_id = params[:id]
  @question = Question.find_by_id(question_id)
  @user = User.find_by_id(session['user_id'])

  erb :question
end

post '/answer/:id' do
  user = User.find_by_id(params[:user_id])
  author = user.username
  question_id = params[:id]
  body = params[:body]
  answer_info = {
    'question_id' => question_id,
    'user_id' => user.id,
    'body' => body
  }
  @question = Question.find_by_id(question_id)
  answer = Answer.create(answer_info)

  html = erb :_displayanswer, :layout => false, locals: {:answer => answer}
  obj = {
    'html' => html,
    'question_id' => question_id
    }
  JSON.dump(obj)
end

get '/debug' do
  @users = User.all

  erb :debug
end
