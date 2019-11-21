class User < ApplicationRecord
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  # validations
  validates_presence_of :username, :email, :password, :password_confirmation 
  validates :password, length: { minimum: 8 }, confirmation: true
  validates :email, uniqueness: { message: "email not unique"}, format: { with: VALID_EMAIL_REGEX, message: "invalid email"}
end
