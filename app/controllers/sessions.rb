enable :sessions

get '/' do
  @user ||= session[:user_id]
  erb :'/sessions/index'
end

post '/login' do
  @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect '/decks'
  else
    redirect '/'
  end
end

post '/signup' do
  @user = User.create(params[:user])
  redirect('/decks')
end

get '/logout' do
  session.clear
  redirect '/'
end
