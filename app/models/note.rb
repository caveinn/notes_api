class Note < ApplicationRecord
  belongs_to :stream
  belongs_to :user

  # validations
  validates :subject, presence: true
  validates :topic, presence: true
  validates :notes, presence: true
  validates :user, presence: true
end
