enable :sessions

get '/' do
  @user ||= session[:user_id]
  erb :'/sessions/index'
end

post '/login' do
  auth = User.authenticate(params[:email], params[:password])
  if auth == nil
    @errors = 
    erb :'sessions/index'
  else
    user = User.find_by(email: params[:email])
    session[:user_id] = user.id
    redirect '/decks'
  end
end

post '/signup' do
  @user = User.create(params[:user])
  redirect('/')
end

post '/logout' do
  session.clear
  redirect '/'
end
