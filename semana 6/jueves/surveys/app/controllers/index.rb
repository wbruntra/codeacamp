# before do
#   pass if ['register', 'signin','signout','debug', nil].include? request.path_info.split('/')[1]
#   if !session['user_id']
#     redirect '/signin'
#   end
# end

get '/' do
  @surveys = Survey.all
  @user = User.find_by_id(session['user_id'])
  p @surveys
  erb :index
end

get '/survey/:id' do
  @survey = Survey.find_by_id(params[:id])

  erb :displaysurvey, locals: {:survey => @survey}
end

get '/create' do
  @user = User.find_by_id(session['user_id'])

  erb :create
end

post '/create' do
  user_id = session['user_id']
  my_json = JSON.parse(request.body.read)
  p my_json
  title = my_json['title']
  survey = Survey.create(title: title, user_id: user_id)
  survey_id = survey.id
  p 'Todo bien'
  questions = my_json['questions']
  p questions
  for q in questions do
    body= q['question']
    question = Question.create(survey_id: survey_id, body: body)
    question_id = question.id
    choices = q['choices']
    for choice in choices do
      Choice.create(question_id: question_id, body: choice)
    end
  end
  JSON.dump(my_json)
end

get '/debug' do
  @users = User.all
  @surveys = Survey.all

  erb :debug
end
