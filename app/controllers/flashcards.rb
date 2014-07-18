get '/decks/:did/flashcards/create' do
  @deck = Deck.find(params[:did])
  @deck.flashcards.create(params[:flashcard])
  erb :'flashcards/create'
end

post '/decks/:did/flashcards/create' do
  @deck = Deck.find(params[:did])
  @deck.flashcards.create(params[:flashcard])
  redirect "decks/#{@deck.id}"
end
