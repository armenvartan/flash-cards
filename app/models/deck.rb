class Deck < ActiveRecord::Base
  has_many :flashcards
  has_many :users, through: :collaborators

  validates_presence_of :topic with: { message: "Please pick a topic" }
end
