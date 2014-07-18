enable :sessions

get '/' do
  @user ||= session[:user_id]
  erb :'/sessions/index'
end

post '/' do
 redirect ('/')
end

get '/login' do

  erb :'/sessions/_login'
end

post '/login' do
  auth = User.authenticate(params[:email], params[:password])
  if auth == nil
    redirect '/login'
  else
    user = User.find_by(email: params[:email])
    session[:user_id] = user.id
    redirect '/'
  end
end

get '/signup' do

  erb :'/sessions/_sign_up'
end

post '/signup' do
  @user = User.create(params[:user])
  redirect('/')
end



post '/logout' do

  redirect '/'
end

