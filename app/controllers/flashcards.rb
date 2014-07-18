get '/' do

  erb :'flashcards/index'
end

get '/flashcards/create' do

  erb :'flashcards/create'
end

get '/flashcards/:fid' do

  erb :'flashcards/show'
end

get '/flashcards/:fid/edit' do

  erb :'flashcards/edit'
end

put '/flashcards/:fid' do
  @flashcard = Flashcard.find(params[:fid])
  @flashcard.update(params[:flashcard])

  redirect "flashcards/#{@flashcard.id}"
end

delete '/flashcards/:fid' do
  @flashcard = Flashcard.find(params[:fid])
  @flashcard.destroy

  redirect '/'
end
