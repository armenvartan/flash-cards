enable :sessions

get '/' do
  @user ||= session[:email][:password]
  erb :index
end

post '/' do

end

get '/login' do

  erb :'/sessions/_login'
end

post '/login' do
  @user = User.authenticate(params[:user][:email], params[:user][:password])
  if session[:email][:password] == @user
    redirect '/'
  else
    redirect '/login'
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

