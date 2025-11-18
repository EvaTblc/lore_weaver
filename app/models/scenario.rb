class Scenario < ApplicationRecord
  has_many :games
  has_many :characters
  
  scope :active, -> { where(active: true) }

  validates :description, presence: true, length: { minimum: 50, maximum: 500 }
  validates :prompt, presence: true
  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
end
