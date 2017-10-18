require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  def self.authenticate(email, password)
    @user = self.find_by(email: email)
    if @user && @user.password == password return @user
      # This legit fucking worked on my other shit. WTF. Syntax error on sinatra-- unexpected keyword return. Here's the fucking error msg:
      # /Users/brittflowers/DBC/devbootcamp/phase-2/passion_project/tune_in_town/app/models/user.rb:11: syntax error, unexpected keyword_return, expecting keyword_do or '{' or '(' if @user && @user.password == password return @user ^ /Users/brittflowers/DBC/devbootcamp/phase-2/passion_project/tune_in_town/app/models/user.rb:27: syntax error, unexpected keyword_end, expecting end-of-input
    else
      nil
    end
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
