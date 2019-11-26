class School < ApplicationRecord
  has_many :streams, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :user, presence: true
  belongs_to :user
end
