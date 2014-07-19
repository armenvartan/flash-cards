class Deck < ActiveRecord::Base
  has_many :flashcards
  has_many :users, through: :collaborators
  has_many :collaborators
  belongs_to :category

  validates_presence_of :title, with: { message: "Please enter a title" }
end
