get '/users/:uid' do
  @user = User.find(params[:uid])
  erb :'users/index'
end

