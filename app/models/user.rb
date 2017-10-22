require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  def self.authenticate(email, password)
    @user = self.find_by(email: email)
    return @user if @user && @user.password == password
    nil
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
