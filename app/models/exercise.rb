class Exercise < ApplicationRecord
  has_and_belongs_to_many :routines

  validates :description, presence: true
  validates :intensity, presence: true
  #second change

  validates_numericality_of :intensity, greater_than_or_equal_to: 0, less_than_or_equal_to: 10
end
