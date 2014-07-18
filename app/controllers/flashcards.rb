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

get '/decks/:did/flashcards/:fid/edit' do
  @flashcard = Flashcard.find(params[:fid])
  erb :'flashcards/edit'
end

put '/decks/:did/flashcards/:fid' do
  deck = Deck.find(params[:did])
  flashcard = deck.flashcards.find(params[:fid])
  flashcard.update(params[:flashcard])
  redirect "/decks/#{deck.id}"
end

delete '/decks/:did/flashcards/:fid' do
  deck = Deck.find(params[:did])
  flashcard = deck.flashcards.find(params[:fid])
  flashcard.destroy
  redirect "/decks/#{deck.id}"
end
