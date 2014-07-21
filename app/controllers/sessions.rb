enable :sessions

get '/' do
  @user ||= session[:user_id]
  if logged_in?
    redirect "/users/#{@user}"
  else
    erb :'/sessions/index'
  end
end

post '/login' do
  @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
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
