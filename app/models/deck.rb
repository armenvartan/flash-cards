class Deck < ActiveRecord::Base
  has_many :flashcards
  has_many :users, through: :collaborators
  has_many :collaborators
end
