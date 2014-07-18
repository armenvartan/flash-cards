require 'Faker'

users = []

5.times do
  users << User.create(name: Faker::Name.name, email:  Faker::Internet.email, password:  Faker::Number.number(5) )
end

decks = []

  users.each do |user|
  decks << user.decks.create(topic: Faker::Lorem.word)
end

decks.each do |deck|
  10.times do
    deck.flashcards.create(question: Faker::Lorem.word, answer: Faker::Lorem.sentence)
  end
end





