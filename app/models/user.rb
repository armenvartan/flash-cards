class User < ActiveRecord::Base
  has_many :decks, through: :collaborators

  def self.authenticate(email, password)
    user = User.find_by email: email
    return user if user.password == password
    return nil
  end
end
