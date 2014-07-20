get '/decks' do
  @decks = Deck.all
  erb :'decks/index'
end

get '/decks/create' do
  @deck = Deck.new
  erb :'decks/create'
end

post '/decks/create' do
  @deck = Deck.new(title: params[:title])
  if @deck.valid?
    category = Category.find_or_create_by(topic: params[:category])
    @deck.category = category
    @deck.save
    erb :'flashcards/_create', layout: false
  else
    @errors = @deck.errors.messages
    erb :'decks/_create_form', layout: false
  end
end

get '/decks/:did' do
  @deck = Deck.find(params[:did])
  @flashcard = @deck.flashcards.first
  erb :'decks/show'
end

get '/decks/:did/edit' do
  @deck = Deck.find(params[:did])
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
