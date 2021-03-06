get '/decks' do
  @decks = Deck.all
  erb :'decks/index'
end

get '/decks/create' do
  @deck = Deck.new
  erb :'decks/create'
end

post '/decks/create' do
  @user = User.find(session[:user_id])
  @deck = Deck.new(title: params[:title])
  if @deck.valid?
    category = Category.find_or_create_by(topic: params[:category])
    @deck.category = category
    @deck.save
    @deck.users << @user
    erb :'flashcards/_create', layout: false
  else
    @errors = @deck.errors.messages
    erb :'decks/_create_form', layout: false
  end
end

get '/decks/:did' do
  @user = User.find(session[:user_id])
  @deck = Deck.find(params[:did])
  p @deck.users.include?(@user)
  @flashcard = @deck.flashcards.sample
  erb :'decks/show'
end

get '/decks/:did/edit' do
  @deck = Deck.find(params[:did])
  @flashcards = @deck.flashcards
  erb :'decks/edit'
end

put '/decks/:did' do
  @deck = Deck.find(params[:did])
  @deck.update(params[:deck])

  redirect "/decks/#{@deck.id}"
end

delete '/decks/:did' do
  @deck = Deck.find(params[:did])
  @deck.destroy

  redirect '/decks'
end
