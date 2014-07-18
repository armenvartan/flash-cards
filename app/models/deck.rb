class Deck < ActiveRecord::Base
  has_many :flashcards
  has_many :users, through: :collaborators
end
