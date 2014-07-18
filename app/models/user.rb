class User < ActiveRecord::Base
  has_many :decks, through: :collaborators
  has_many :collaborators
end
