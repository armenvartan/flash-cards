class User < ActiveRecord::Base
  has_many :decks, through: :collaborators
end
