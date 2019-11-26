class Stream < ApplicationRecord
  belongs_to :school
  has_many :notes, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
