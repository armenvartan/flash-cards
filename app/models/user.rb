class User < ActiveRecord::Base
  has_many :decks, through: :collaborators
  has_many :collaborators

  validates_presence_of :name
  validates :email, uniqueness: true, format: { with: /\w+\.?\w+@\w{2,}\.\w{2,}/, message: "Please enter a valid email" }
  validates :password, format: { with: /\S{5,}/, message: "Please have a password with a minimum of 5 characters and no whitespace characters" }

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    return user if user.password == password
    nil
  end
end
