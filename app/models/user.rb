class User < ApplicationRecord
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  # validations
  validates_presence_of :username, :email 
  validates_presence_of :password, :password_confirmation, :if => :password
  validates :password, length: { minimum: 8 }, confirmation: true, :if => :password
  validates :email, uniqueness: { message: "email not unique"}, format: { with: VALID_EMAIL_REGEX, message: "invalid email"}
  has_many :schools, dependent: :destroy
end
