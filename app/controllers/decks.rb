get '/' do

  erb :'decks/index'
end

get '/decks/create' do

  erb :'decks/create'
end

get '/decks/:did' do

  erb :'decks/show'
end

get '/decks/:did/edit' do

  erb :'decks/edit'
end

put '/decks/:did' do
  @deck = Deck.find(params[:did])
  @deck.update(params[:deck])

  redirect "decks/#{@deck.id}"
end

delete '/decks/:did' do
  @deck = Deck.find(params[:did])
  @deck.destroy

  redirect '/'
end
