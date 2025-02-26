class Routine < ApplicationRecord
  has_and_belongs_to_many :exercises

  validates :exercises, presence: true
  validates :name, presence: true
  #second PR changes
end
