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
    @deck.category = params[:category]
    @deck.save
  else
    @errors = @deck.errors
    erb :'decks/create'
  end
end

get '/decks/:did' do
  @deck = Deck.find(params[:did])
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
