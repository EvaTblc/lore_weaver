class Scenario < ApplicationRecord
  has_many :games
  has_many :characters

  scope :active, -> { where(active: true) }

  CATEGORIES = %w( SF Thriller Medieval Horror Romantic )

  validates :description, presence: true, length: { minimum: 50, maximum: 500 }
  validates :prompt, presence: true
  validates :category, presence: true, inclusion: { in: Scenario::CATEGORIES }
  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
end
