class User < ActiveRecord::Base
  # Remember to create a migration!
  include BCrypt

  has_many :responses
  has_many :surveys

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(user_password)
    @password = Password.create(user_password)
    self.password_digest = @password
  end

  def self.authenticate(username, user_password)
    user = User.find_by(username: username)
    if user && (user.password == user_password)
      return user
    else
      nil
    end
  end
end
