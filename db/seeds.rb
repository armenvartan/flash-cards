5.times do
  User.create(name: Faker::Name.name, email:  Faker::Internet.email, password:  Faker::Number.number(5) )
end

5.times{ Category.create(topic: Faker::Lorem.word) }

User.all.each do |user|
  user.decks.create(title: Faker::Lorem.word, category_id: Category.all.sample.id)
end

Deck.all.each do |deck|
  10.times do
    deck.flashcards.create(question: Faker::Lorem.word, answer: Faker::Lorem.sentence)
  end
end


