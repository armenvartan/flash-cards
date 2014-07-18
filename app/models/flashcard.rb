class Flashcard < ActiveRecord::Base
  belongs_to :deck

  validates_presence_of :question, :answer, with: { message: "Please make sure no fields are empty" }
end
