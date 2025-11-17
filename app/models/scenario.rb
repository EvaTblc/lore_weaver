class Scenario < ApplicationRecord
  has_many :games

  validates :description, presence: true, length: { minimum: 50, maximum: 500 }
  validates :prompt, presence: true
  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
end
