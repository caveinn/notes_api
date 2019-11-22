class Stream < ApplicationRecord
  belongs_to :school

  validates :name, presence: true, uniqueness: true
end
