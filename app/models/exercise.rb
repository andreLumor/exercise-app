class Exercise < ApplicationRecord
  has_and_belongs_to_many :routines

  validates :description, presence: true
  validates :intensity, presence: true

  validates_numericality_of :intensity, greater_than_or_equal_to: 0, less_than_or_equal_to: 10
  #fist change to the models
  # Change to the first PR
  # second change
end
